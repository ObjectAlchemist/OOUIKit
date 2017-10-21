//
//  ViewMultiLayer.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 A view container that presents the child contents above each other.
 Use it to position elements independent to each other.
 */
public final class ViewMultiLayer: OOView {
    
    // MARK: init
    
    public init(layoutMargin: LayoutMargin = LayoutMargin.none, content: [OOView]) {
        self.layoutMargin = layoutMargin
        self.content = content
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        content.forEach { $0.setNeedsRefresh() }
        _ui?.setNeedsLayout()
    }
    
    // MARK: private
    
    private let layoutMargin: LayoutMargin
    private let content: [OOView]
    
    private func createView() -> UIView {
        let view = PointInsideCheckingView()
        content.forEach {
            let content = $0.ui
            content.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(content)
            content.topAnchor.constraint(equalTo: layoutMargin.rawValue & LayoutMargin.top.rawValue > 0 ? view.layoutMarginsGuide.topAnchor : view.topAnchor).isActive = true
            content.bottomAnchor.constraint(equalTo: layoutMargin.rawValue & LayoutMargin.bottom.rawValue > 0 ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor).isActive = true
            content.leadingAnchor.constraint(equalTo: layoutMargin.rawValue & LayoutMargin.leading.rawValue > 0 ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor).isActive = true
            content.trailingAnchor.constraint(equalTo: layoutMargin.rawValue & LayoutMargin.trailing.rawValue > 0 ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor).isActive = true
        }
        return view
    }
    
}
