//
//  ColorDefault.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public let ColorBlack: OOColor = ColorDefault(.black)
public let ColorDarkGray: OOColor = ColorDefault(.darkGray)
public let ColorLightGray: OOColor = ColorDefault(.lightGray)
public let ColorWhite: OOColor = ColorDefault(.white)
public let ColorGray: OOColor = ColorDefault(.gray)
public let ColorRed: OOColor = ColorDefault(.red)
public let ColorGreen: OOColor = ColorDefault(.green)
public let ColorBlue: OOColor = ColorDefault(.blue)
public let ColorCyan: OOColor = ColorDefault(.cyan)
public let ColorYellow: OOColor = ColorDefault(.yellow)
public let ColorMagenta: OOColor = ColorDefault(.magenta)
public let ColorOrange: OOColor = ColorDefault(.orange)
public let ColorPurple: OOColor = ColorDefault(.purple)
public let ColorBrown: OOColor = ColorDefault(.brown)
public let ColorClear: OOColor = ColorDefault(.clear)
public let ColorLightText: OOColor = ColorDefault(.lightText)
public let ColorDarkText: OOColor = ColorDefault(.darkText)

enum ColorValue {
    
    case black      // 0.0 white
    case darkGray   // 0.333 white
    case lightGray  // 0.667 white
    case white      // 1.0 white
    case gray       // 0.5 white
    case red        // 1.0, 0.0, 0.0 RGB
    case green      // 0.0, 1.0, 0.0 RGB
    case blue       // 0.0, 0.0, 1.0 RGB
    case cyan       // 0.0, 1.0, 1.0 RGB
    case yellow     // 1.0, 1.0, 0.0 RGB
    case magenta    // 1.0, 0.0, 1.0 RGB
    case orange     // 1.0, 0.5, 0.0 RGB
    case purple     // 0.5, 0.0, 0.5 RGB
    case brown      // 0.6, 0.4, 0.2 RGB
    case clear      // 0.0 white, 0.0 alpha
    case lightText  // for a dark background
    case darkText   // for a light background
    
}

/**
 A Color object based on a default color from enum
 */
final class ColorDefault: OOColor {
    
    // MARK: init
    
    init(_ color: ColorValue) {
        self.color = color
    }
    
    // MARK: protocol OOColor
    
    var value: UIColor {
        switch(color) {
        case .black: return UIColor.black
        case .darkGray: return UIColor.darkGray
        case .lightGray: return UIColor.lightGray
        case .white: return UIColor.white
        case .gray: return UIColor.gray
        case .red: return UIColor.red
        case .green: return UIColor.green
        case .blue: return UIColor.blue
        case .cyan: return UIColor.cyan
        case .yellow: return UIColor.yellow
        case .magenta: return UIColor.magenta
        case .orange: return UIColor.orange
        case .purple: return UIColor.purple
        case .brown: return UIColor.brown
        case .clear: return UIColor.clear
        case .lightText: return UIColor.lightText
        case .darkText: return UIColor.darkText
        }
    }
    
    // MARK: private
    
    private let color: ColorValue
    
}
