//
//  ViewCentered.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import Foundation
import OOBase

/**
 A view container that present the content inside a centered rectangle of fixed size

 Visual:
           ---
            |
            |
 |--<centered content>--|
            |
            |
           ---
 */
public final class ViewCentered: OOViewWrap {

    public init(width: OOFloat, height: OOFloat, content: OOView) {
        super.init(
            origin: ViewVerticalCentered(
                width: width,
                content: ViewHorizontalCentered(
                    height: height,
                    content: content
                )
            )
        )
    }
    
}

// convenience initializer
public extension ViewCentered {
    
    public convenience init(width: Float, height: Float, content: OOView) {
        self.init(width: FloatConst(width), height: FloatConst(height), content: content)
    }
    
    public convenience init(width: Float, height: OOFloat, content: OOView) {
        self.init(width: FloatConst(width), height: height, content: content)
    }
    
    public convenience init(width: OOFloat, height: Float, content: OOView) {
        self.init(width: width, height: FloatConst(height), content: content)
    }
    
}
