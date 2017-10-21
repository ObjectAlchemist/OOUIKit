//
//  StringHexFromColor.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
// General idea from: https://gist.github.com/yannickl/16f0ed38f0698d9a8ae7

import UIKit
import OOBase

/**
 A hex value String created from a concrete color.
 */
public final class StringHexFromColor: OOString {
    
    // MARK: init

    public init(color: OOColor) {
        self.color = color
    }
    
    // MARK: protocol OOString
    
    public var value: String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        color.value.getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
    // MARK: private
    
    private let color: OOColor
    
}

// convenience initializer
public extension StringHexFromColor {
    
    public convenience init(color: UIColor) {
        self.init(color: ColorConst(color))
    }
    
}
