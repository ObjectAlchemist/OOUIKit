//
//  AlertWithAction.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

public enum ActionStyle {
    
    case normal
    case cancel
    case destruct
    
}

/**
 A decorator for an alert that adds a button with an action.
 */
public final class AlertWithAction: OOAlert {
    
    // MARK: init

    public init(_ decorated: OOAlert, text: OOString, action: OOExecutable = DoNothing(), style: ActionStyle = .normal) {
        self.decorated = decorated
        self.text = text
        self.action = action
        self.style = style
    }
    
    // MARK: protocol OOAlert
    
    public var ui: UIAlertController {
        let controller = decorated.ui
        controller.addAction(
            UIAlertAction(title: text.value, style: alertStyle) { [action] _ in
                action.execute()
            }
        )
        return controller
    }
    
    // MARK: private
    
    private let decorated: OOAlert
    private let text: OOString
    private let action: OOExecutable
    private let style: ActionStyle
    
    private var alertStyle: UIAlertActionStyle {
        switch style {
        case .normal: return .default
        case .cancel: return .cancel
        case .destruct: return .destructive
        }
    }
    
}

// convenience initializer
public extension AlertWithAction {
    
    public convenience init(_ decorated: OOAlert, text: String, action: OOExecutable = DoNothing(), style: ActionStyle = .normal) {
        self.init(decorated, text: StringConst(text), action: action, style: style)
    }
    
}
