//
//  ViewStackHorizontalEqual.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 A view container that present the contents horizontal stacked with every element equal width.
 
 Visual: e.g. 3 contents
 |content1|content2|content3|
 */
public final class ViewStackHorizontalEqual: OOView {
    
    // MARK: init
    
    public init(content childs: [OOView]) {
        guard childs.count != 0 else { fatalError("A container without childs doesn't make any sense!") }
        self.childs = childs
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        childs.forEach { $0.setNeedsRefresh() }
    }
    
    // MARK: private
    
    private let childs: [OOView]
    
    private func createView() -> UIView {
        let view = PointInsideCheckingView()
        view.backgroundColor = UIColor.clear
        addChilds(toView: view)
        return view
    }
    
    private func addChilds(toView parentView: UIView) {
        var previousChildView: UIView? = nil
        childs.forEach { viewRepresentation in
            let childView = viewRepresentation.ui
            childView.translatesAutoresizingMaskIntoConstraints = false
            parentView.addSubview(childView)
            childView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
            childView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
            if let previousView = previousChildView {
                childView.leadingAnchor.constraint(equalTo: previousView.trailingAnchor).isActive = true
                childView.widthAnchor.constraint(equalTo: previousView.widthAnchor).isActive = true
            } else {
                childView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
            }
            previousChildView = childView
        }
        previousChildView!.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
    }
    
}
