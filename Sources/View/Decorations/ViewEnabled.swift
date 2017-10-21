//
//  ViewEnabled.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A container that enables/disables a child content.
 */
public final class ViewEnabled: OOView {
    
    // MARK: init

    public init(enabled: OOBool, content: OOView) {
        self.content = content
        self.enabled = enabled
    }
    
    // MARK: protocol OOView
    
    private var _created: Bool = false
    public var ui: UIView {
        _created = true
        updateEnabled()
        return content.ui
    }
    
    public func setNeedsRefresh() {
        if _created {
            updateEnabled()
            content.setNeedsRefresh()
        }
    }
    
    // MARK: private
    
    private let content: OOView
    private let enabled: OOBool
    
    private func updateEnabled() {
        let ui = content.ui
        if let control = ui as? UIControl {
            control.isEnabled = enabled.value
        } else {
            ui.isUserInteractionEnabled = enabled.value
        }
    }
    
}
