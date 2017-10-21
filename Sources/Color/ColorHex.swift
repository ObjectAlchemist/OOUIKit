//
//  ColorHex.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
// General idea from: https://gist.github.com/yannickl/16f0ed38f0698d9a8ae7

import UIKit
import OOBase

/**
 A ColorRepresentation based on hex string.
 Define it as "#FFFFFF" or "FFFFFF"
 */
public final class ColorHex: OOColor {
    
    // MARK: init

    public init(_ hexString: OOString, alpha: OOFloat) {
        self.hexString = hexString
        self.alpha = alpha
    }
    
    // MARK: protocol OOColor
    
    public var value: UIColor {
        let hexString = self.hexString.value
        let scanner = Scanner(string: hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let red = CGFloat(Int(color >> 16) & mask) / 255.0
        let green = CGFloat(Int(color >> 8) & mask) / 255.0
        let blue = CGFloat(Int(color) & mask) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha.value))
    }
    
    // MARK: private
    
    private let hexString: OOString
    private let alpha: OOFloat
    
}

// convenience initializer
public extension ColorHex {
    
    public convenience init(_ hexString: String, alpha: Float = 1) {
        self.init(StringConst(hexString), alpha: FloatConst(alpha))
    }
    
    public convenience init(_ hexString: String, alpha: OOFloat) {
        self.init(StringConst(hexString), alpha: alpha)
    }
    
    public convenience init(_ hexString: OOString, alpha: Float = 1) {
        self.init(hexString, alpha: FloatConst(alpha))
    }
    
}
