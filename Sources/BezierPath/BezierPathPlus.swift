//
//  BezierPathPlus.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/** 
 A path drawing a plus '+'
 */
public final class BezierPathPlus: OOBezierPath {
    
    // MARK: init
    
    public init(size: CGSize, borderGap: CGFloat = 2) {
        self.size = size
        self.borderGap = borderGap
    }
    
    // MARK: protocol OOBezierPath
    
    public var ui: UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: borderGap, y: size.height/2))
        bezierPath.addLine(to: CGPoint(x: size.width - borderGap, y: size.height/2))
        bezierPath.move(to: CGPoint(x: size.width/2, y: borderGap))
        bezierPath.addLine(to: CGPoint(x: size.width/2, y: size.height - borderGap))
        return bezierPath
    }
    
    // MARK: private
    
    private let size: CGSize
    private let borderGap: CGFloat
    
}
