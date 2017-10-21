//
//  ImageThreeVerticalDots.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/** 
 An image with three vertical dots, like the more button in android
 */
public final class ImageThreeVerticalDots: OOImage {
    
    // MARK: init
    
    public init(width: OOFloat, color: OOColor) {
        self.width = width
        self.color = color
    }
    
    // MARK: protocol OOImage
    
    public var ui: UIImage {
        let width = CGFloat(self.width.value)
        let diameter = width/8
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: width), false, 0)
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()
        
        let xCenter = width/2
        for i in 1..<4 {
            let yCenter = width * CGFloat(i) / 4
            let rect = CGRect(x: xCenter - diameter / 2, y: yCenter - diameter / 2, width: diameter, height: diameter)
            context.setFillColor(color.value.cgColor)
            context.fillEllipse(in: rect)
        }
        
        context.restoreGState()
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    // MARK: private
    
    private let width: OOFloat
    private let color: OOColor
    
}
