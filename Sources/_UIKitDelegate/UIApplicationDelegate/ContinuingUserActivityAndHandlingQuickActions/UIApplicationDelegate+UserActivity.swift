//
//  UIApplicationDelegate+UserActivity.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 02.11.17.
//  
//

import UIKit

/**
 Implementation of UIApplicationDelegate section:
 - Continuing User Activity and Handling Quick Actions
 See documentation of UIApplicationDelegate for more informations.
 */
public extension UIApplicationDelegateWrap {
    
    final func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        return origin.application?(application, willContinueUserActivityWithType: userActivityType) ?? false
    }
    
    final func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Swift.Void) -> Bool {
        // Note: calling the handler is optional
        return origin.application?(application, continue: userActivity, restorationHandler: restorationHandler) ?? false
    }
    
    final func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        origin.application?(application, didUpdate: userActivity)
    }
    
    final func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        origin.application?(application, didFailToContinueUserActivityWithType: userActivityType, error: error)
    }
    
    final func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Swift.Void) {
        if origin.application?(application, performActionFor: shortcutItem, completionHandler: completionHandler) == nil {
            completionHandler(true)
        }
    }
    
}

/**
 Implementation of UIApplicationDelegate section:
 - Continuing User Activity and Handling Quick Actions
 See documentation of UIApplicationDelegate for more informations.
 */
public extension UIApplicationDelegateSplitting {
    
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        for delegate in delegates {
            if let result = delegate.application?(application, willContinueUserActivityWithType: userActivityType) { return result }
        }
        return false
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Swift.Void) -> Bool {
        // Note: calling the handler is optional
        for delegate in delegates {
            if let result = delegate.application?(application, continue: userActivity, restorationHandler: restorationHandler) { return result }
        }
        return false
    }
    
    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        delegates.forEach { $0.application?(application, didUpdate: userActivity) }
    }
    
    func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        delegates.forEach { $0.application?(application, didFailToContinueUserActivityWithType: userActivityType, error: error) }
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Swift.Void) {
        for delegate in delegates {
            if let _ = delegate.application?(application, performActionFor: shortcutItem, completionHandler: completionHandler) { return }
        }
        completionHandler(true)
    }
    
}
