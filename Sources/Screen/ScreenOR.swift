//
//  ScreenOR.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/** 
 A screen container that displays primary OR secondary child content depending on condition.
 The container listens for changes in the adapter and updates content automatically.
 */
public final class ScreenOR: OOScreen {
    
    // MARK: init

    public init(condition: OOBool,
                conditionChangeListener: OOEventInform,
                isTrue primary: @escaping (UIViewController) -> OOScreen,
                isFalse secondary: @escaping (UIViewController) -> OOScreen) {
        self.condition = condition
        self.conditionChangeListener = conditionChangeListener
        self.primary = primary
        self.secondary = secondary
    }
    
    // MARK: protocol OOScreen
    
    public var ui: UIViewController {
        let controller = ORContainerViewController(primaryAvailable: condition, primary: primary, secondary: secondary)
        conditionChangeListener.set(onEvent: { [weak controller] in controller?.update() })
        return controller
    }
    
    // MARK: private
    
    private let condition: OOBool
    private let conditionChangeListener: OOEventInform
    private let primary: (UIViewController) -> OOScreen
    private let secondary: (UIViewController) -> OOScreen
    
}

// convenience initializer
public extension ScreenOR {
    
    public convenience init(condition: OOWritableBool & OOEventInform, isTrue primary: @escaping (UIViewController) -> OOScreen, isFalse secondary: @escaping (UIViewController) -> OOScreen) {
        self.init(condition: condition, conditionChangeListener: condition, isTrue: primary, isFalse: secondary)
    }
    
}
