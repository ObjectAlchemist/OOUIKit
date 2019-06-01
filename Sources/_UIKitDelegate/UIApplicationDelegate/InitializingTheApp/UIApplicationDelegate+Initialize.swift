//
//  UIApplicationDelegate+Initialize.swift
//  OOSwift
//
//  Created by Karsten Litsche on 02.11.17.
//  
//

import UIKit

/**
 Implementation of UIApplicationDelegate sections:
 - Initializing the App
 - Providing a Window for Storyboarding
 See documentation of UIApplicationDelegate for more informations.
*/
public extension UIApplicationDelegateWrap {
    
    final func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return origin.application?(application, willFinishLaunchingWithOptions: launchOptions) ?? true
    }
    
    final func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return origin.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
    }
    
    final func applicationDidFinishLaunching(_ application: UIApplication) {
        origin.applicationDidFinishLaunching?(application)
    }

    final var window: UIWindow? {
        get { return origin.window! }
        set(value) { fatalError("Not supported!") }
    }
    
}

/**
 Implementation of UIApplicationDelegate sections:
 - Initializing the App
 - Providing a Window for Storyboarding
 See documentation of UIApplicationDelegate for more informations.
 */
public extension UIApplicationDelegateSplitting {
    
    final func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        for delegate in delegates {
            if let result = delegate.application?(application, willFinishLaunchingWithOptions: launchOptions) { return result }
        }
        return true
    }
    
    final func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        for delegate in delegates {
            if let result = delegate.application?(application, didFinishLaunchingWithOptions: launchOptions) { return result }
        }
        return true
    }
    
    final func applicationDidFinishLaunching(_ application: UIApplication) {
        delegates.forEach { $0.applicationDidFinishLaunching?(application) }
    }

    final var window: UIWindow? {
        get {
            for delegate in delegates {
                if let result = delegate.window { return result }
            }
            return nil
        }
        set(value) { fatalError("Not supported!") }
    }
    
}
