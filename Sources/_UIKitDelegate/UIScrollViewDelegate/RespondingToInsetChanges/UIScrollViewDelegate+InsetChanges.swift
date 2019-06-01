//
//  UIScrollViewDelegate+InsetChanges.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit

public extension UIScrollViewDelegateWrap {
    
    final func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        origin.scrollViewDidChangeAdjustedContentInset?(scrollView)
    }
    
}

public extension UIScrollViewDelegateSplitting {
    
    final func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidChangeAdjustedContentInset?(scrollView) }
    }
    
}
