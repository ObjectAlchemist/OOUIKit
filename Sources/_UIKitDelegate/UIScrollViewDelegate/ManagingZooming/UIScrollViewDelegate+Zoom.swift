//
//  UIScrollViewDelegate+Zoom.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit

public extension UIScrollViewDelegateWrap {
    
    final func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return origin.viewForZooming?(in: scrollView)
    }
    
    final func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        origin.scrollViewWillBeginZooming?(scrollView, with: view)
    }
    
    final func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        origin.scrollViewDidEndZooming?(scrollView, with: view, atScale: scale)
    }
    
    final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        origin.scrollViewDidZoom?(scrollView)
    }
    
}

public extension UIScrollViewDelegateSplitting {
    
    final func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for delegate in delegates {
            if let result = delegate.viewForZooming?(in: scrollView) { return result }
        }
        return nil
    }
    
    final func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        delegates.forEach { $0.scrollViewWillBeginZooming?(scrollView, with: view) }
    }
    
    final func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        delegates.forEach { $0.scrollViewDidEndZooming?(scrollView, with: view, atScale: scale) }
    }
    
    final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidZoom?(scrollView) }
    }
    
}
