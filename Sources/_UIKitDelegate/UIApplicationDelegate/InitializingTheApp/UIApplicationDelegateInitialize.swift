//
//  UIApplicationDelegateInitialize.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//  
//

import UIKit
import OOBase

/**
 Implementation of UIApplicationDelegate sections:
 - Initializing the App
 - Providing a Window for Storyboarding
 See documentation of UIApplicationDelegate for more informations.
 */
public final class UIApplicationDelegateInitialize: UIResponder, UIApplicationDelegate {
    
    // MARK: - init
    
    public init(
        willFinishLaunchingWithOptions: @escaping (UIApplication, [UIApplication.LaunchOptionsKey: Any]?) -> OOBool = { _,_ in BoolConst(true) },
        didFinishLaunchingWithOptions: @escaping (UIApplication, [UIApplication.LaunchOptionsKey: Any]?) -> OOBool = { _,_ in BoolConst(true) },
        didFinishLaunching: @escaping (UIApplication) -> OOExecutable = { _ in DoNothing() },
        appWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
        ) {
        self.willFinishLaunchingWithOptions = willFinishLaunchingWithOptions
        self.didFinishLaunchingWithOptions = didFinishLaunchingWithOptions
        self.didFinishLaunching = didFinishLaunching
        self.appWindow = appWindow
        super.init()
    }

    // MARK: - protocol: UIApplicationDelegate
    
    public func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return willFinishLaunchingWithOptions(application, launchOptions).value
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return didFinishLaunchingWithOptions(application, launchOptions).value
    }
    
    public func applicationDidFinishLaunching(_ application: UIApplication) {
        didFinishLaunching(application).execute()
    }
    
    public var window: UIWindow? {
        get { return appWindow }
        set(value) { fatalError("Not supported!") }
    }
  
    // MARK: - private
    
    private let willFinishLaunchingWithOptions: (UIApplication, [UIApplication.LaunchOptionsKey: Any]?) -> OOBool
    private let didFinishLaunchingWithOptions: (UIApplication, [UIApplication.LaunchOptionsKey: Any]?) -> OOBool
    private let didFinishLaunching: (UIApplication) -> OOExecutable
    private let appWindow: UIWindow

}

// convenience initializer
public extension UIApplicationDelegateInitialize {

    convenience init(screenFlow: OOScreen) {
        self.init(didFinishLaunchingWithOptions: { application,_ in
            BoolDoWhenGetValue(true, action:
                DoSetScreenFlow(application: application, screenFlow: screenFlow)
            )
        })
    }
    
}
