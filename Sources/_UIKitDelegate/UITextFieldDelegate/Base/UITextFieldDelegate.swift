//
//  UITextFieldDelegate.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 05.11.17.
//

import UIKit

open /*abstract*/ class UITextFieldDelegateWrap: NSObject, UITextFieldDelegate {
    
    // MARK: init
    
    public init(origin: UITextFieldDelegate) {
        self.origin = origin
    }
    
    // MARK: - api for extensions only
    
    // Note: we make it public, so an extension for specialized functionality may be written in other frameworks.
    public let origin: UITextFieldDelegate
    
    // MARK: private
    
}

public final class UITextFieldDelegateSplitting: NSObject, UITextFieldDelegate {
    
    // MARK: init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(delegates: [UITextFieldDelegate]) {
        guard delegates.count > 1 else { fatalError("A splitter only makes sense with 2 or more objects!") }
        self.delegates = delegates
    }
    
    // MARK: - api for extension only
    
    // Note: we make it public, so an extension for specialized functionality may be written in other frameworks.
    public let delegates: [UITextFieldDelegate]
    
    // MARK: private
    
}
