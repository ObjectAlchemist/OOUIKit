//
//  UIApplicationDelegateRemoteNotification.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//
//

import UIKit
import OOBase

/**
 Implementation of UIApplicationDelegate section:
 - Handling Remote Notification Registration
 See documentation of UIApplicationDelegate for more informations.
 */
public final class UIApplicationDelegateRemoteNotification: UIResponder, UIApplicationDelegate {
    
    // MARK: - init
    
    public init(
        didRegisterForRemoteNotifications: @escaping (UIApplication, Data) -> OOExecutable = { _,_ in DoNothing() },
        didFailToRegisterForRemoteNotifications: @escaping (UIApplication, Error) -> OOExecutable = { _,_ in DoNothing() },
        didReceiveRemoteNotification: @escaping (UIApplication, [AnyHashable : Any], @escaping (UIBackgroundFetchResult) -> Swift.Void) -> OOExecutable = { _,_,completion in DoGenericSnippet { completion(.noData) } }
        ) {
        self.didRegisterForRemoteNotifications = didRegisterForRemoteNotifications
        self.didFailToRegisterForRemoteNotifications = didFailToRegisterForRemoteNotifications
        self.didReceiveRemoteNotification = didReceiveRemoteNotification
        super.init()
    }
    
    // MARK: - protocol: UIApplicationDelegate
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        didRegisterForRemoteNotifications(application, deviceToken).execute()
    }
    
    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        didFailToRegisterForRemoteNotifications(application, error).execute()
    }
    
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        didReceiveRemoteNotification(application, userInfo, completionHandler).execute()
    }
    
    // MARK: - private
    
    private let didRegisterForRemoteNotifications: (UIApplication, Data) -> OOExecutable
    private let didFailToRegisterForRemoteNotifications: (UIApplication, Error) -> OOExecutable
    private let didReceiveRemoteNotification: (UIApplication, [AnyHashable : Any], @escaping (UIBackgroundFetchResult) -> Swift.Void) -> OOExecutable
    
}

