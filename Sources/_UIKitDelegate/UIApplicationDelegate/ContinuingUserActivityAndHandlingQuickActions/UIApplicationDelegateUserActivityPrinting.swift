//
//  UIApplicationDelegateUserActivityPrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//
//

import UIKit

/**
 Print the UIApplicationDelegate section:
 - Continuing User Activity and Handling Quick Actions
 
 Use this decorator to log the print outputs while development/debugging. Define a filterKey if you need a
 clear identification of this instance.
 For more informations see UIPrintOverload.swift and UIApplicationDelegate documentation
 */
public final class UIApplicationDelegateUserActivityPrinting: UIResponder, UIApplicationDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(_ decorated: UIApplicationDelegate, filterKey: String = "") {
        self.decorated = decorated
        // add space if exist to separate following log
        self.filterKey = filterKey.count == 0 ? "" : "\(filterKey) "
    }
    
    // MARK: - protocol: UIApplicationDelegate
    
    public func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        printUI("\(filterKey)application willContinueUserActivity called (\n  userActivityType=\(userActivityType)\n)")
        return decorated.application?(application, willContinueUserActivityWithType: userActivityType) ?? false
    }
    
    public func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Swift.Void) -> Bool {
        // Note: calling the handler is optional
        printUI("\(filterKey)application continueUserActivity called (\n  userActivityType=\(userActivity.activityType)\n)")
        return decorated.application?(application, continue: userActivity, restorationHandler: restorationHandler) ?? false
    }
    
    public func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        printUI("\(filterKey)application didUpdate called (\n  userActivityType=\(userActivity.activityType)\n)")
        decorated.application?(application, didUpdate: userActivity)
    }
    
    public func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        printUI("\(filterKey)application didFailToContinueUserActivity called (\n  userActivityType=\(userActivityType)\n  error=\(error.localizedDescription)\n)")
        decorated.application?(application, didFailToContinueUserActivityWithType: userActivityType, error: error)
    }
    
    public func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Swift.Void) {
        printUI("\(filterKey)application performActionForShortcutItem called (\n  shortcutItemType=\(shortcutItem.type)\n)")
        if decorated.application?(application, performActionFor: shortcutItem, completionHandler: completionHandler) == nil {
            completionHandler(true)
        }
    }
    
    // MARK: - private
    
    private let decorated: UIApplicationDelegate
    private let filterKey: String
    
}

