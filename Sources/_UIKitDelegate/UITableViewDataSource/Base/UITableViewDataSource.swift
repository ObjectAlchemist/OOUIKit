//
//  UITableViewDataSource.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

/**
 Usage:
 The UITableViewDataSource protocol contains too much functionality for one implementation. Apple already split
 it into sections in the documentation. We use the same sections here to split it too.
 The base implementations (Wrap and Splitting) are implemented to be extended here, because splitting them into several
 objects will not work. The specific implementations are splitted into objects with functionalities belonging together.
 
 e.g.
 Using only one functionality:
 let myDelegate = UITableViewDataSourceConfiguration(...)
 Using two or more functionalities:
 let myDelegate = UITableViewDataSourceSplitting(delegates: [
    UITableViewDataSourceConfiguration(..),
    UITableViewDataSourceInsertAndDelete(..),
    ...
 ])
 Note: When using the second solution you have to ensure that the first delegate is the Configuration!
 */
open /*abstract*/ class UITableViewDataSourceWrap: NSObject, UITableViewDataSource {
    
    // MARK: init
    
    // Note: Has to be public, or the init of the wrap deriving classs will not be called!
    public convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(origin: UITableViewDataSource) {
        self.origin = origin
    }
    
    // MARK: - api for extensions only
    
    // Note: we make it public, so an extension for specialized functionality may be written in other frameworks.
    public let origin: UITableViewDataSource

    // MARK: private
    
}

public final class UITableViewDataSourceSplitting: NSObject, UITableViewDataSource {
    
    // MARK: init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(delegates: [UITableViewDataSource]) {
        guard delegates.count > 1 else { fatalError("A splitter only makes sense with 2 or more objects!") }
        self.delegates = delegates
    }
    
    // MARK: - api for extension only
    
    // Note: we make it public, so an extension for specialized functionality may be written in other frameworks.
    public let delegates: [UITableViewDataSource]
    
    // MARK: private
    
}
