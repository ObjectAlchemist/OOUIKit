//
//  ViewLabel.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A view displaying a text label.
 */
public final class ViewLabel: OOView {
    
    // MARK: init

    public init(title: OOString, color: OOColor = ColorDefault(.darkText), font: OOFont = FontSystem(size: 12), textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.title = title
        self.color = color
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
    
    // MARK: protocol OOView
    
    private var _ui: UILabel?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        if _ui != nil { update(label: _ui!) }
        _ui?.setNeedsLayout()
    }
    
    // MARK: private
    
    private let title: OOString
    private let color: OOColor
    private let font: OOFont
    private let textAlignment: NSTextAlignment
    private let numberOfLines: Int
    
    private func createView() -> UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        update(label: label)
        return label
    }
    
    private func update(label: UILabel) {
        label.text = title.value
        label.textColor = color.value
        label.font = font.value
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
    }
    
}

public extension ViewLabel {
    
    public convenience init(title: String, color: OOColor = ColorDefault(.darkText), font: OOFont = FontSystem(size: 12), textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init(title: StringConst(title), color: color, font: font, textAlignment: textAlignment, numberOfLines: numberOfLines)
    }
    
}
