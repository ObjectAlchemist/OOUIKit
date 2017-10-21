//
//  ViewStackVertical.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public let VerticalStretched: Float = -1

/**
 A view container that presents it's contents in a vertical top based stack.
 Note: Last view ignores it's height and stretches to end (use VerticalStretched to tell)! Add a VrSpace at end if you don't like it.

 Visual:
    ---
 <content1>
 <content2>
     ^
 
 content3 (height=VerticalStretched)
 
     v
    ---
 */
public final class ViewStackVertical: OOView {
    
    // MARK: init
    
    public init(content childs: [(height: Float, view: OOView)]) {
        guard childs.count != 0 else { fatalError("A container without childs doesn't make any sense!") }
        guard childs.filter( { $0.height == VerticalStretched }).count == 1 else { fatalError("A stack must contain exactly one child with height=VerticalStretched!") }
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
    
    private let childs: [(height: Float, view: OOView)]
    
    private func createView() -> UIView {
        let view = PointInsideCheckingView()
        view.backgroundColor = UIColor.clear
        addChilds(toView: view)
        return view
    }
    
    private func addChilds(toView parentView: UIView) {
        let last = childs.last!.view
        var previousChild: UIView?
        childs.forEach { (height: Float, view: OOView) in
            let childView = view.ui
            childView.translatesAutoresizingMaskIntoConstraints = false
            parentView.addSubview(childView)
            childView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
            childView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
            childView.topAnchor.constraint(equalTo: previousChild==nil ? parentView.topAnchor : previousChild!.bottomAnchor).isActive = true
            if last === view {
                childView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
            }
            if height != VerticalStretched {
                childView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            }
            previousChild = childView
        }
    }
    
}
