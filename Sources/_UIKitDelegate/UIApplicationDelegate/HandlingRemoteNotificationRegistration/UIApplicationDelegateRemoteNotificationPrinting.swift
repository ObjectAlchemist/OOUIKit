//
//  UIApplicationDelegateRemoteNotificationPrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//
//

import UIKit

/**
 Print the UIApplicationDelegate section:
 - Handling Remote Notification Registration
 
 Use this decorator to log the print outputs while development/debugging. Define a filterKey if you need a
 clear identification of this instance.
 For more informations see UIPrintOverload.swift and UIApplicationDelegate documentation
 */
public final class UIApplicationDelegateRemoteNotificationPrinting: UIResponder, UIApplicationDelegate {
    
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
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        printUI("\(filterKey)application didRegisterForRemoteNotifications called (\n  deviceToken=\(deviceToken)\n)")
        decorated.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        printUI("\(filterKey)application didFailToRegisterForRemoteNotifications called (\n  error=\(error.localizedDescription)\n)")
        decorated.application?(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        printUI("\(filterKey)application didReceiveRemoteNotification called (\n  userInfo=\(userInfo)\n)")
        if decorated.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler) == nil {
            completionHandler(.noData)
        }
    }
    
    // MARK: - private
    
    private let decorated: UIApplicationDelegate
    private let filterKey: String
    
}

