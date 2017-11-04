//
//  UITableViewDelegate.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

open /*abstract*/ class UITableViewDelegateWrap: NSObject, UITableViewDelegate {
    
    // MARK: init
    
    public init(origin: UITableViewDelegate) {
        self.origin = origin
    }
    
    // MARK: - api for extensions only
    
    // Note: we make it public, so an extension for specialized functionality may be written in other frameworks.
    public let origin: UITableViewDelegate
    
    // MARK: private
    
}

public final class UITableViewDelegateSplitting: NSObject, UITableViewDelegate {
    
    // MARK: init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(delegates: [UITableViewDelegate]) {
        guard delegates.count > 1 else { fatalError("A splitter only makes sense with 2 or more objects!") }
        self.delegates = delegates
    }
    
    // MARK: - api for extension only
    
    // Note: we make it public, so an extension for specialized functionality may be written in other frameworks.
    public let delegates: [UITableViewDelegate]
    
    // MARK: private
    
}
