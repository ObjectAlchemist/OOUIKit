//
//  UIApplicationDelegate+BackgroundDownload.swift
//  OOSwift
//
//  Created by Karsten Litsche on 02.11.17.
//  
//

import UIKit

/**
 Implementation of UIApplicationDelegate section:
 - Downloading Data in the Background
 See documentation of UIApplicationDelegate for more informations.
 */
public extension UIApplicationDelegateWrap {
    
    public final func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        if origin.application?(application, performFetchWithCompletionHandler: completionHandler) == nil {
            completionHandler(.noData)
        }
    }
    
    public final func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Swift.Void) {
        if origin.application?(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler) == nil {
            completionHandler()
        }
    }
    
}

/**
 Implementation of UIApplicationDelegate section:
 - Downloading Data in the Background
 See documentation of UIApplicationDelegate for more informations.
 */
public extension UIApplicationDelegateSplitting {
    
    public func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        for delegate in delegates {
            if let _ = delegate.application?(application, performFetchWithCompletionHandler: completionHandler) { return }
        }
        completionHandler(.noData)
    }
    
    public func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Swift.Void) {
        for delegate in delegates {
            if let _ = delegate.application?(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler) { return }
        }
        completionHandler()
    }
    
}
