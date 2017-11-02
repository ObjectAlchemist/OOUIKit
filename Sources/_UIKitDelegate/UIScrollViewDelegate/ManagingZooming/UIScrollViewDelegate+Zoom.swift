//
//  UIScrollViewDelegate+Zoom.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit

public extension UIScrollViewDelegateWrap {
    
    public final func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return origin.viewForZooming?(in: scrollView)
    }
    
    public final func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        origin.scrollViewWillBeginZooming?(scrollView, with: view)
    }
    
    public final func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        origin.scrollViewDidEndZooming?(scrollView, with: view, atScale: scale)
    }
    
    public final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        origin.scrollViewDidZoom?(scrollView)
    }
    
}

public extension UIScrollViewDelegateSplitting {
    
    public final func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for delegate in delegates {
            if let result = delegate.viewForZooming?(in: scrollView) { return result }
        }
        return nil
    }
    
    public final func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        delegates.forEach { $0.scrollViewWillBeginZooming?(scrollView, with: view) }
    }
    
    public final func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        delegates.forEach { $0.scrollViewDidEndZooming?(scrollView, with: view, atScale: scale) }
    }
    
    public final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidZoom?(scrollView) }
    }
    
}
