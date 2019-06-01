//
//  FontSystem.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

public enum FontWeight {
    
    case regular
    case bold
    case italic

}

public final class FontSystem: OOFont {
    
    // MARK: init

    public init(size: OOInt, weight: FontWeight = .regular) {
        self.size = size
        self.weight = weight
    }
    
    // MARK: protocol OOFont
    
    public var value: UIFont {
        let size = CGFloat(self.size.value)
        switch(weight) {
        case .regular: return UIFont.systemFont(ofSize: size)
        case .bold: return UIFont.boldSystemFont(ofSize: size)
        case .italic: return UIFont.italicSystemFont(ofSize: size)
        }
    }
    
    // MARK: private
    
    private let size: OOInt
    private let weight: FontWeight
    
}

// convenience initializer
public extension FontSystem {
    
    convenience init(size: Int, weight: FontWeight = .regular) {
        self.init(size: IntConst(size), weight: weight)
    }
    
}
