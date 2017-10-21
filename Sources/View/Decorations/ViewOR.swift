//
//  ViewOR.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A view container that switches the subview depending on a condition.
 */
public final class ViewOR: OOView {
    
    // MARK: init
    
    public init(condition: OOBool, conditionChangeListener: OOEventInform, primary: @escaping () -> OOView, secondary: @escaping () -> OOView) {
        self.condition = condition
        self.conditionChangeListener = conditionChangeListener
        self.primary = primary
        self.secondary = secondary
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        currentChild?.setNeedsRefresh()
    }
    
    // MARK: private
    
    private let condition: OOBool
    private let conditionChangeListener: OOEventInform
    private let primary: () -> OOView
    private let secondary: () -> OOView
    private var lastKnownCondition: Bool?
    private var currentChild: OOView?
    
    private func createView() -> UIView {
        let view = PointInsideCheckingView()
        setChild(toContainer: view)
        conditionChangeListener.set { [weak self, weak view] in
            self?.setChild(toContainer: view!)
        }
        return view
    }
    
    private func setChild(toContainer parentView: UIView) {
        let conditionValue = condition.value
        if lastKnownCondition == nil || lastKnownCondition != conditionValue {
            currentChild = (conditionValue ? primary : secondary)()
            lastKnownCondition = conditionValue
            parentView.subviews.forEach { $0.removeFromSuperview() }
            let childView = currentChild!.ui
            childView.translatesAutoresizingMaskIntoConstraints = false
            parentView.addSubview(childView)
            childView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
            childView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
            childView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
            childView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        }
    }
    
}

// convenience initializer
public extension ViewOR {
    
    public convenience init(condition: OOWritableBool & OOEventInform, primary: @escaping () -> OOView, secondary: @escaping () -> OOView) {
        self.init(condition: condition, conditionChangeListener: condition, primary: primary, secondary: secondary)
    }
    
}
