//
//  DoPrintFontFamilies.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

public final class DoPrintFontFamilies: OOExecutable {
    
    // MARK: init
    
    public init() {}
    
    // MARK: protocol OOExecutable
    
    public func execute() {
        UIFont.familyNames.forEach { printUI(UIFont.fontNames(forFamilyName: $0)) }
    }
    
    // MARK: private
    
}
