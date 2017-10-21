//
//  ViewBordered.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

/**
 A container that adds borders to the contained view

 Visual:
       ---
        B
       ---
 |B|<content>|B|
       ---
        B
       ---
 */
public final class ViewBordered: OOViewWrap {
    
    public init(top: Float = 0, bottom: Float = 0, left: Float = 0, right: Float = 0, content: OOView) {
        super.init(
            origin: ViewFixedAnchored(leading: left, trailing: -right, top: top, bottom: -bottom, content: content)
        )
    }
    
}
