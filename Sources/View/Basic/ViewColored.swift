//
//  ViewColored.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public enum LayoutMargin: UInt32 {
    case none = 0
    case leading = 1
    case trailing = 2
    case top = 4
    case bottom = 8
    case all = 15
}

/**
 A view with a color and an optional child content.
 Use it to define background colors behind other OOView.
 It is good practice to have one colored background and add sub elements with transparent background.
 */
public final class ViewColored: OOView {
    
    // MARK: init

    init(color: OOColor, layoutMargin: LayoutMargin, contained: OOView?) {
        self.color = color
        self.layoutMargin = layoutMargin
        self.contained = contained
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        contained?.setNeedsRefresh()
        _ui?.setNeedsLayout()
    }
    
    // MARK: private
    
    private let color: OOColor
    private let contained: OOView?
    private let layoutMargin: LayoutMargin
    
    private func createView() -> UIView {
        let view = UIView()
        view.backgroundColor = color.value
        if let content = contained?.ui {
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

// convenience initializer
public extension ViewColored {
    
    convenience init(color: OOColor = ColorWhite, layoutMargin: LayoutMargin = LayoutMargin.none) {
        self.init(color: color, layoutMargin: layoutMargin, contained: nil)
    }
    
    convenience init(color: OOColor = ColorWhite, layoutMargin: LayoutMargin = LayoutMargin.none, content: OOView) {
        self.init(color: color, layoutMargin: layoutMargin, contained: content)
    }
    
}
