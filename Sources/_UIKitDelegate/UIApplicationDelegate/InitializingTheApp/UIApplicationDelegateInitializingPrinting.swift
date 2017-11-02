//
//  UIApplicationDelegateInitializingPrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//  
//

import UIKit

/**
 Print the UIApplicationDelegate sections:
 - Initializing the App
 - Providing a Window for Storyboarding

 Use this decorator to log the print outputs while development/debugging. Define a filterKey if you need a
 clear identification of this instance.
 For more informations see UIPrintOverload.swift and UIApplicationDelegate documentation
 */
public final class UIApplicationDelegateInitializingPrinting: UIResponder, UIApplicationDelegate {
    
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
    
    public func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let options = launchOptions == nil ? "nil" : "\(launchOptions!)"
        printUI("\(filterKey)application willFinishLaunchingWithOptions called (\n  launchOptions=\(options)\n)")
        return decorated.application?(application, willFinishLaunchingWithOptions: launchOptions) ?? false
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let options = launchOptions == nil ? "nil" : "\(launchOptions!)"
        printUI("\(filterKey)application didFinishLaunchingWithOptions called (\n  launchOptions=\(options)\n)")
        return decorated.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? false
    }
    
    public func applicationDidFinishLaunching(_ application: UIApplication) {
        printUI("\(filterKey)applicationDidFinishLaunching called")
        decorated.applicationDidFinishLaunching?(application)
    }
    
    public var window: UIWindow? {
        get {
            printUI("\(filterKey)application get window called")
            return decorated.window!
        }
        set(value) { fatalError("Not supported!") }
    }
    
    // MARK: - private
    
    private let decorated: UIApplicationDelegate
    private let filterKey: String
    
}
