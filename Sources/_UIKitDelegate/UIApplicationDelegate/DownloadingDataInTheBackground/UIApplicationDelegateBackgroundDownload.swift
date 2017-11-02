//
//  UIApplicationDelegateBackgroundDownload.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//  
//

import UIKit
import OOBase

/**
 Implementation of UIApplicationDelegate section:
 - Downloading Data in the Background
 See documentation of UIApplicationDelegate for more informations.
 */
public final class UIApplicationDelegateBackgroundDownload: UIResponder, UIApplicationDelegate {
    
    // MARK: - init
    
    public init(
        performFetchWithCompletionHandler: @escaping (UIApplication, @escaping (UIBackgroundFetchResult) -> ()) -> OOExecutable = { _,completion in DoGenericSnippet { completion(.noData) } },
        handleEventsForBackgroundURLSession: @escaping (UIApplication, String, @escaping () -> ()) -> OOExecutable = { _,_,completion in DoGenericSnippet { completion() } }
        ) {
        self.performFetchWithCompletionHandler = performFetchWithCompletionHandler
        self.handleEventsForBackgroundURLSession = handleEventsForBackgroundURLSession
        super.init()
    }

    // MARK: - protocol: UIApplicationDelegate
    
    public func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        performFetchWithCompletionHandler(application, completionHandler).execute()
    }
    
    public func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Swift.Void) {
        handleEventsForBackgroundURLSession(application, identifier, completionHandler).execute()
    }
  
    // MARK: - private
    
    private let performFetchWithCompletionHandler: (UIApplication, @escaping (UIBackgroundFetchResult) -> ()) -> OOExecutable
    private let handleEventsForBackgroundURLSession: (UIApplication, String, @escaping () -> ()) -> OOExecutable
    
}
