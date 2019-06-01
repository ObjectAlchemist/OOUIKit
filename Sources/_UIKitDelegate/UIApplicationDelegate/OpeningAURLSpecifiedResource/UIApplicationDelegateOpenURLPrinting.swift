//
//  UIApplicationDelegateOpenURLPrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//
//

import UIKit

/**
 Print the UIApplicationDelegate section:
 - Opening a URL-Specified Resource
 
 Use this decorator to log the print outputs while development/debugging. Define a filterKey if you need a
 clear identification of this instance.
 For more informations see UIPrintOverload.swift and UIApplicationDelegate documentation
 */
public final class UIApplicationDelegateOpenURLPrinting: UIResponder, UIApplicationDelegate {
    
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
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        printUI("\(filterKey)application openUrl called (\n  url=\(url.absoluteString)\n  options=\(options)\n)")
        return decorated.application?(app, open: url, options: options) ?? false
    }
    
    // MARK: - private
    
    private let decorated: UIApplicationDelegate
    private let filterKey: String
    
}

