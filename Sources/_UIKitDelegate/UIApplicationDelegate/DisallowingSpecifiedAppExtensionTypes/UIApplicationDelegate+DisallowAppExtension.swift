//
//  UIApplicationDelegate+DisallowAppExtension.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 02.11.17.
//  
//

import UIKit

/**
 Implementation of UIApplicationDelegate section:
 - Disallowing Specified App Extension Types
 See documentation of UIApplicationDelegate for more informations.
 */
public extension UIApplicationDelegateWrap {
    
    final func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplicationExtensionPointIdentifier) -> Bool {
        return origin.application?(application, shouldAllowExtensionPointIdentifier: extensionPointIdentifier) ?? true
    }
    
}

/**
 Implementation of UIApplicationDelegate section:
 - Disallowing Specified App Extension Types
 See documentation of UIApplicationDelegate for more informations.
 */
public extension UIApplicationDelegateSplitting {
    
    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplicationExtensionPointIdentifier) -> Bool {
        for delegate in delegates {
            if let result = delegate.application?(application, shouldAllowExtensionPointIdentifier: extensionPointIdentifier) { return result }
        }
        return true
    }
    
}
