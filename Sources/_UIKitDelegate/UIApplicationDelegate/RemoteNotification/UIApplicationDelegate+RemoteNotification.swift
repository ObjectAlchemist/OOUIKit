//
//  UIApplicationDelegate+RemoteNotification.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 02.11.17.
//  
//

import UIKit

/**
 Implementation of UIApplicationDelegate section:
 - Handling Remote Notification Registration
 See documentation of UIApplicationDelegate for more informations.
 */
public extension UIApplicationDelegateWrap {
    
    public final func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        origin.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    public final func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        origin.application?(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    public final func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        if origin.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler) == nil {
            completionHandler(.noData)
        }
    }
    
}

/**
 Implementation of UIApplicationDelegate section:
 - Handling Remote Notification Registration
 See documentation of UIApplicationDelegate for more informations.
 */
public extension UIApplicationDelegateSplitting {
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        delegates.forEach { $0.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken) }
    }
    
    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        delegates.forEach { $0.application?(application, didFailToRegisterForRemoteNotificationsWithError: error) }
    }
    
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        for delegate in delegates {
            if let _ = delegate.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler) { return }
        }
        completionHandler(.noData)
    }
    
}
