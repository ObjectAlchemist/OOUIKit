//
//  UIApplicationDelegate.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//  
//

import UIKit

/**
 Usage:
 The UIApplicationDelegate protocol contains too much functionality for one implementation. Apple already split
 it into sections in the documentation. We use the same sections here to split it too.
 The base implementations (Wrap and Splitting) are implemented to be extended here, because splitting them into several
 objects will not work. The specific implementations are splitted into objects with functionalities belonging together.
 
 e.g.
 @UIApplicationMain
 final class MyAppDelegate: UIApplicationDelegateWrap {
    init() {
        super.init(origin: UIApplicationDelegateSplitting(delegates: [
            UIApplicationDelegateInitialize(..),
            UIApplicationDelegateOpenURL(..),
            ...
        ]))
    }
 }
 */
open /*abstract*/ class UIApplicationDelegateWrap: UIResponder, UIApplicationDelegate {
    
    // MARK: - init
    
    public init(origin: UIApplicationDelegate) {
        self.origin = origin
    }
    
    // MARK: - api for extensions only
    
    // Note: we make it public, so an extension for specialized functionality may be written in other frameworks.
    public let origin: UIApplicationDelegate
    
    // MARK: - private
    
}

public final class UIApplicationDelegateSplitting: UIResponder, UIApplicationDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(delegates: [UIApplicationDelegate]) {
        guard delegates.count > 1 else { fatalError("A splitter only makes sense with 2 or more objects!") }
        self.delegates = delegates
    }
    
    // MARK: - api for extension only
    
    // Note: we make it public, so an extension for specialized functionality may be written in other frameworks.
    public let delegates: [UIApplicationDelegate]
    
    // MARK: - private
    
}
