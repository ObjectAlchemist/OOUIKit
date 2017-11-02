//
//  UIApplicationDelegateOpenURL.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//
//

import UIKit
import OOBase

/**
 Implementation of UIApplicationDelegate section:
 - Opening a URL-Specified Resource
 See documentation of UIApplicationDelegate for more informations.
 */
public final class UIApplicationDelegateOpenURL: UIResponder, UIApplicationDelegate {
    
    // MARK: - init
    
    public init(
        openUrl: @escaping (UIApplication, URL, [UIApplicationOpenURLOptionsKey : Any]) -> OOBool = { _,_,_ in BoolConst(false) }
        ) {
        self.openUrl = openUrl
        super.init()
    }
    
    // MARK: - protocol: UIApplicationDelegate
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return openUrl(app, url, options).value
    }
    
    // MARK: - private
    
    private let openUrl: (UIApplication, URL, [UIApplicationOpenURLOptionsKey : Any]) -> OOBool
    
}

