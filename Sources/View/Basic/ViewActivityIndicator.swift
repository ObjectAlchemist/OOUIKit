//
//  ViewActivityIndicator.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A view displaying an activity indicator.
 */
public final class ViewActivityIndicator: OOView {
    
    // MARK: init

    public init(action: OOExecutable = DoNothing(), shouldRun: OOBool = BoolConst(true), color: OOColor = ColorWhite, large: OOBool = BoolConst(true)) {
        self.action = action
        self.shouldRun = shouldRun
        self.color = color
        self.large = large
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIActivityIndicatorView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        if _ui != nil { update(view: _ui!) }
        _ui?.setNeedsLayout()
    }
    
    // MARK: private
    
    private let action: OOExecutable
    private let shouldRun: OOBool
    private let color: OOColor
    private let large: OOBool
    
    private func createView() -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(activityIndicatorStyle: large.value ? .whiteLarge : .white)
        update(view: view)
        return view
    }
    
    private func update(view: UIActivityIndicatorView) {
        view.activityIndicatorViewStyle = large.value ? .whiteLarge : .white
        view.color = color.value
        if shouldRun.value {
            view.startAnimating()
            action.execute()
        } else {
            view.stopAnimating()
        }
    }
    
}
