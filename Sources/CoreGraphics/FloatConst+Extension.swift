//
//  FloatConst+Extension.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import CoreGraphics
import OOBase

public extension FloatConst {
    
    public convenience init(_ value: CGFloat) {
        self.init(Float(value))
    }

}
