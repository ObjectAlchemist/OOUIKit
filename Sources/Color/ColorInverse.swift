//
//  ColorInverse.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
// General idea from: https://stackoverflow.com/a/26955657/6595536

import UIKit

/**
 A decorator that invert the decorated ColorRepresentation
 */
public final class ColorInverse: OOColor {
    
    // MARK: init

    public init(_ decorated: OOColor) {
        self.decorated = decorated
    }
    
    // MARK: protocol OOColor
    
    public var value: UIColor {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        if decorated.value.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: 1.0 - r, green: 1.0 - g, blue: 1.0 - b, alpha: a)
        }
        fatalError("This color is not invertable!")
    }
    
    // MARK: private
    
    private let decorated: OOColor
    
}

// convenience initializer
public extension ColorInverse {
    
    convenience init(_ decorated: UIColor) {
        self.init(ColorConst(decorated))
    }
    
}
