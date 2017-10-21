//
//  FontCustom.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

public final class FontCustom: OOFont {
    
    // MARK: init
    
    public init(_ name: OOString, size: OOInt) {
        self.name = name
        self.size = size
    }
    
    // MARK: protocol OOFont
    
    public var value: UIFont {
        let name = self.name.value
        let font = UIFont(name: name, size: CGFloat(size.value))
        guard font != nil else { fatalError("There is no font \(name)! Maybe file/fontid are different (check with DoPrintFontFamilies) or you forget to insert font into info.plist as UIAppFonts!") }
        return font!
    }
    
    // MARK: private
    
    private let name: OOString
    private let size: OOInt
    
}

// convenience initializer
public extension FontCustom {
    
    public convenience init(_ name: String, size: Int) {
        self.init(StringConst(name), size: IntConst(size))
    }
    
    public convenience init(_ name: String, size: OOInt) {
        self.init(StringConst(name), size: size)
    }
    
    public convenience init(_ name: OOString, size: Int) {
        self.init(name, size: IntConst(size))
    }
    
}
