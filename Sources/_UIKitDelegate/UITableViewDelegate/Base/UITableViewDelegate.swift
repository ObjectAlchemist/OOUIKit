//
//  UITableViewDelegate.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

/**
 Usage:
 The UITableViewDelegate protocol contains too much functionality for one implementation. Apple already split
 it into sections in the documentation. We use the same sections here to split it too.
 The base implementations (Wrap and Splitting) are implemented to be extended here, because splitting them into several
 objects will not work. The specific implementations are splitted into objects with functionalities belonging together.
 
 e.g.
 Using only one functionality:
 let myDelegate = UITableViewDelegateSelection(...)
 Using two or more functionalities:
 let myDelegate = UITableViewDelegateSplitting(delegates: [
    UITableViewDelegateSelection(..),
    UITableViewDelegateSectionHeaderAndFooter(..),
    ...
 ])
 */
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
