//
//  ColorDefault.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public enum DefaultColor {
    
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
public final class ColorDefault: OOColor {
    
    // MARK: init
    
    public init(_ color: DefaultColor = .white) {
        self.color = color
    }
    
    // MARK: protocol OOColor
    
    public var value: UIColor {
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
    
    private let color: DefaultColor
    
}
