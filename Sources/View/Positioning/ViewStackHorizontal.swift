//
//  ViewStackHorizontal.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

// TODO: change it so it doesnt has to be last
public let HorizontalStretched: Float = -1

/**
 A view container that present the contents horizontal ordered.
 Note: Last view ignores it's width and stretches to end (use HorizontalStretched to tell)! Add a VrSpace at end if you don't like it.
 
 Visual: e.g. 3 contents
 |content1|content2|coooontent3|
 */
public final class ViewStackHorizontal: OOView {
    
    // MARK: init
    
    public init(content childs: [(width: Float, view: OOView)]) {
        guard childs.count != 0 else { fatalError("A container without childs doesn't make any sense!") }
        guard childs.last!.width == HorizontalStretched else { fatalError("Last element will be stretched, use width=HorizontalStretched!") }
        self.childs = childs
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        childs.forEach { $0.view.setNeedsRefresh() }
    }
    
    // MARK: private
    
    private let childs: [(width: Float, view: OOView)]
    
    private func createView() -> UIView {
        let view = PointInsideCheckingView()
        view.backgroundColor = UIColor.clear
        addChilds(toView: view)
        return view
    }
    
    private func addChilds(toView parentView: UIView) {
        let last = childs.last!.view
        var leadingAnchor = parentView.leadingAnchor
        childs.forEach { (width: Float, view: OOView) in
            let childView = view.ui
            childView.translatesAutoresizingMaskIntoConstraints = false
            parentView.addSubview(childView)
            childView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
            childView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
            childView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            if view === last {
                childView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
            } else {
                childView.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
                leadingAnchor = childView.trailingAnchor
            }
        }
    }
    
}
