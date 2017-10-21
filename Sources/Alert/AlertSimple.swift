//
//  AlertSimple.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A screen alert that display a title and a text.
 */
public final class AlertSimple: OOAlert {
    
    // MARK: init

    public init(title: OOString, text: OOString) {
        self.title = title
        self.text = text
    }
    
    // MARK: protocol OOAlert
    
    public var ui: UIAlertController {
        return UIAlertController(title: title.value, message: text.value, preferredStyle: .alert)
    }
    
    // MARK: private
    
    private let title: OOString
    private let text: OOString
    
}

// convenience initializer
public extension AlertSimple {
    
    public convenience init(title: String = "", text: String) {
        self.init(title: StringConst(title), text: StringConst(text))
    }
    
    public convenience init(title: String = "", text: OOString) {
        self.init(title: StringConst(title), text: text)
    }
    
    public convenience init(title: OOString, text: String) {
        self.init(title: title, text: StringConst(text))
    }
    
}
