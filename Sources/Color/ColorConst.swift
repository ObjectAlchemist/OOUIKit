//
//  ColorConst.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 A OOColor based on a fixed UIColor
 */
public final class ColorConst: OOColor {
    
    // MARK: init
    
    public init(_ value: UIColor) {
        self.value = value
    }
    
    // MARK: protocol OOColor
    
    public let value: UIColor
    
    // MARK: private
    
}
