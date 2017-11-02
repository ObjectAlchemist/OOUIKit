//
//  UIApplicationDelegateUserActivity.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//
//

import UIKit
import OOBase

/**
 Implementation of UIApplicationDelegate section:
 - Continuing User Activity and Handling Quick Actions
 See documentation of UIApplicationDelegate for more informations.
 */
public final class UIApplicationDelegateUserActivity: UIResponder, UIApplicationDelegate {
    
    // MARK: - init
    
    public init(
        willContinueUserActivity: @escaping (UIApplication, String) -> OOBool = { _,_ in BoolConst(false) },
        continueUserActivity: @escaping (UIApplication, NSUserActivity, @escaping ([Any]?) -> ()) -> OOBool = { _,_,_ in BoolConst(false) },
        didUpdateUserActivity: @escaping (UIApplication, NSUserActivity) -> OOExecutable = { _,_ in DoNothing() },
        didFailToContinueUserActivity: @escaping (UIApplication, String, Error) -> OOExecutable = { _,_,_ in DoNothing() },
        performActionForShortcutItem: @escaping (UIApplication, UIApplicationShortcutItem, @escaping (Bool) -> ()) -> OOExecutable = { _,_,completion in DoGenericSnippet { completion(true) } }
        ) {
        self.willContinueUserActivity = willContinueUserActivity
        self.continueUserActivity = continueUserActivity
        self.didUpdateUserActivity = didUpdateUserActivity
        self.didFailToContinueUserActivity = didFailToContinueUserActivity
        self.performActionForShortcutItem = performActionForShortcutItem
        super.init()
    }
    
    // MARK: - protocol: UIApplicationDelegate
    
    public func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        return willContinueUserActivity(application, userActivityType).value
    }
    
    public func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Swift.Void) -> Bool {
        return continueUserActivity(application, userActivity, restorationHandler).value
    }
    
    public func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        didUpdateUserActivity(application, userActivity).execute()
    }
    
    public func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        didFailToContinueUserActivity(application, userActivityType, error).execute()
    }
    
    public func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Swift.Void) {
        performActionForShortcutItem(application, shortcutItem, completionHandler).execute()
    }
    
    // MARK: - private
    
    private let willContinueUserActivity: (UIApplication, String) -> OOBool
    private let continueUserActivity: (UIApplication, NSUserActivity, @escaping ([Any]?) -> ()) -> OOBool
    private let didUpdateUserActivity: (UIApplication, NSUserActivity) -> OOExecutable
    private let didFailToContinueUserActivity: (UIApplication, String, Error) -> OOExecutable
    private let performActionForShortcutItem: (UIApplication, UIApplicationShortcutItem, @escaping (Bool) -> ()) -> OOExecutable
    
}

