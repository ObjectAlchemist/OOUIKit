//
//  UIScrollViewDelegate+ScrollAnimation.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit

public extension UIScrollViewDelegateWrap {
    
    final func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        origin.scrollViewDidEndScrollingAnimation?(scrollView)
    }
    
}

public extension UIScrollViewDelegateSplitting {
    
    final func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidEndScrollingAnimation?(scrollView) }
    }
    
}
