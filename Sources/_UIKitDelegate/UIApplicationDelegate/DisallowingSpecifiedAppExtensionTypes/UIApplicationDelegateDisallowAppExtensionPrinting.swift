//
//  UIApplicationDelegateDisallowAppExtensionPrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//  
//

import UIKit

/**
 Print the UIApplicationDelegate section:
 - Disallowing Specified App Extension Types

 Use this decorator to log the print outputs while development/debugging. Define a filterKey if you need a
 clear identification of this instance.
 For more informations see UIPrintOverload.swift and UIApplicationDelegate documentation
 */
public final class UIApplicationDelegateDisallowAppExtensionPrinting: UIResponder, UIApplicationDelegate {
    
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
    
    public func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        printUI("\(filterKey)application shouldAllowExtensionPointIdentifier called (\n  extensionPointIdentifier=\(extensionPointIdentifier.rawValue)\n)")
        return decorated.application?(application, shouldAllowExtensionPointIdentifier: extensionPointIdentifier) ?? true
    }

    // MARK: - private
    
    private let decorated: UIApplicationDelegate
    private let filterKey: String
    
}
