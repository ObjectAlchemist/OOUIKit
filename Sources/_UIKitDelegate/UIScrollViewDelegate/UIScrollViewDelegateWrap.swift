//
//  UIScrollViewDelegateWrap.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

open /*abstract*/ class UIScrollViewDelegateWrap: NSObject, UIScrollViewDelegate {
    
    // MARK: init
    
    public init(origin: UIScrollViewDelegate) {
        self.origin = origin
    }
    
    // MARK: protocol UIScrollViewDelegate
    
    public final func scrollViewDidScroll(_ scrollView: UIScrollView) {
        origin.scrollViewDidScroll?(scrollView)
    }
    
    public final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        origin.scrollViewDidZoom?(scrollView)
    }
    
    public final func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        origin.scrollViewWillBeginDragging?(scrollView)
    }
    
    public final func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        origin.scrollViewWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    public final func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        origin.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
    }
    
    public final func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        origin.scrollViewWillBeginDecelerating?(scrollView)
    }
    
    public final func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        origin.scrollViewDidEndDecelerating?(scrollView)
    }
    
    public final func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        origin.scrollViewDidEndScrollingAnimation?(scrollView)
    }
    
    public final func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return origin.viewForZooming?(in: scrollView)
    }
    
    public final func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        origin.scrollViewWillBeginZooming?(scrollView, with: view)
    }
    
    public final func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        origin.scrollViewDidEndZooming?(scrollView, with: view, atScale: scale)
    }
    
    public final func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return origin.scrollViewShouldScrollToTop?(scrollView) ?? true
    }
    
    public final func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        origin.scrollViewDidScrollToTop?(scrollView)
    }
    
    // MARK: private
    
    private let origin: UIScrollViewDelegate
    
}
