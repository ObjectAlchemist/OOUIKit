//
//  UIApplicationDelegateDisallowAppExtension.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//  
//

import UIKit
import OOBase

/**
 Implementation of UIApplicationDelegate section:
 - Disallowing Specified App Extension Types
 See documentation of UIApplicationDelegate for more informations.
 */
public final class UIApplicationDelegateDisallowAppExtension: UIResponder, UIApplicationDelegate {
    
    // MARK: - init
    
    public init(
        shouldAllowExtensionPointIdentifier: @escaping (UIApplication, UIApplication.ExtensionPointIdentifier) -> OOBool = { _,_ in BoolConst(true) }
        ) {
        self.shouldAllowExtensionPointIdentifier = shouldAllowExtensionPointIdentifier
        super.init()
    }

    // MARK: - protocol: UIApplicationDelegate
    
    public func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        return shouldAllowExtensionPointIdentifier(application, extensionPointIdentifier).value
    }
    
    // MARK: - private
    
    private let shouldAllowExtensionPointIdentifier: (UIApplication, UIApplication.ExtensionPointIdentifier) -> OOBool
    
}
