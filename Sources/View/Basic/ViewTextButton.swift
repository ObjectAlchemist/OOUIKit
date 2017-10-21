//
//  ViewTextButton.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase
import OOFoundation

/**
 A view displaying a text button with an executable.
 When trigger the button interaction after deallocating this object it will crash (objc compatibiloity issue)!
 */
public final class ViewTextButton: OOView {
    
    // MARK: init

    public init(title: OOString, color: OOColor = ColorDefault(.white), font: OOFont = FontSystem(size: 12), action: OOExecutable) {
        self.title = title
        self.color = color
        self.font = font
        self.action = DoObjC(action) // encapsulate it so we can use it as selector
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIButton?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        if _ui != nil { update(button: _ui!) }
        _ui?.setNeedsLayout()
    }
    
    // MARK: private
    
    private let title: OOString
    private let action: DoObjC
    private let color: OOColor
    private let font: OOFont
    
    private func createView() -> UIButton {
        let button = UIButton(type: .custom)
        button.addTarget(action, action: #selector(DoObjC.execute), for: .touchUpInside)
        update(button: button)
        return button
    }
    
    private func update(button: UIButton) {
        button.setTitle(title.value, for: .normal)
        button.setTitleColor(color.value, for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .highlighted)
        button.setTitleColor(UIColor.lightGray, for: .disabled)
        button.titleLabel!.font = font.value
    }
    
}

// convenience initializer
public extension ViewTextButton {
    
    public convenience init(title: String, color: OOColor = ColorDefault(.white), font: OOFont = FontSystem(size: 12), action: OOExecutable) {
        self.init(title: StringConst(title), color: color, font: font, action: action)
    }
    
}
