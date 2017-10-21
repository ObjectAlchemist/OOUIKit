//
//  PointInsideCheckingView.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

final class PointInsideCheckingView: UIView {
    
    // MARK: init
    
    // MARK: UIView
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for view in subviews {
            if !view.isHidden && view.alpha > 0.01 && view.isUserInteractionEnabled && view.point(inside: convert(point, to: view), with: event) {
               return true
            }
        }
        return false
    }
    
    // MARK: private
    
}
