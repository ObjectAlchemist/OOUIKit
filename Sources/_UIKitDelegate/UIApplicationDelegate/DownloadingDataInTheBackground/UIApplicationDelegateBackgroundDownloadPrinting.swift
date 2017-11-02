//
//  UIApplicationDelegateInitializingPrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//  
//

import UIKit

/**
 Print the UIApplicationDelegate section:
 - Downloading Data in the Background
 
 Use this decorator to log the print outputs while development/debugging. Define a filterKey if you need a
 clear identification of this instance.
 For more informations see UIPrintOverload.swift and UIApplicationDelegate documentation
 */
public final class UIApplicationDelegateBackgroundDownloadPrinting: UIResponder, UIApplicationDelegate {
    
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
    
    public func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        printUI("\(filterKey)application performFetchWithCompletionHandler called")
        if decorated.application?(application, performFetchWithCompletionHandler: completionHandler) == nil {
            completionHandler(.noData)
        }
    }
    
    public func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Swift.Void) {
        printUI("\(filterKey)application handleEventsForBackgroundURLSession called (\n  identifier=\(identifier)\n)")
        if decorated.application?(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler) == nil {
            completionHandler()
        }
    }

    // MARK: - private
    
    private let decorated: UIApplicationDelegate
    private let filterKey: String
    
}
