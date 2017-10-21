//
//  ScreenWrappedAlert.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 A screen wrapping an alert inside. Configure it before wrap it.
 */
public final class ScreenWrappedAlert: OOScreen {
    
    // MARK: init
    
    public init(_ alert: OOAlert) {
       self.alert = alert
    }
    
    // MARK: protocol Screen
    
    public var ui: UIViewController {
        return alert.ui
    }
    
    // MARK: private
    
    private let alert: OOAlert
    
}
