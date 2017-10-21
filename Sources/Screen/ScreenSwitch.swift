//
//  ScreenSwitch.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A container that updates the content by screen id changes.
 Use it for screen flows.
 */
public final class ScreenSwitch: OOScreen {
    
    // MARK: init
    
    public init(screenId: OOInt, conditionChangeListener: OOEventInform, screens: [(UIViewController) -> OOScreen]) {
        self.screenId = screenId
        self.conditionChangeListener = conditionChangeListener
        self.screens = screens
    }
    
    // MARK: protocol OOScreen
    
    public var ui: UIViewController {
        let controller = SwitchContainerViewController(screenId: screenId, screens: screens)
        conditionChangeListener.set(onEvent: { [weak controller] in controller?.update() })
        return controller
    }
    
    // MARK: private
    
    private let screenId: OOInt
    private let conditionChangeListener: OOEventInform
    private let screens: [(UIViewController) -> OOScreen]
    
}

// convenience initializer
public extension ScreenSwitch {
    
    public convenience init(screenId: OOWritableInt & OOEventInform, screens: [(UIViewController) -> OOScreen]) {
        self.init(screenId: screenId, conditionChangeListener: screenId, screens: screens)
    }
    
}
