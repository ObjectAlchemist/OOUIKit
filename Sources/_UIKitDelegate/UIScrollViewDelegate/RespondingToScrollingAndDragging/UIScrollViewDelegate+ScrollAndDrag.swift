//
//  UIScrollViewDelegate+ScrollAndDrag.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit

public extension UIScrollViewDelegateWrap {
    
    final func scrollViewDidScroll(_ scrollView: UIScrollView) {
        origin.scrollViewDidScroll?(scrollView)
    }
    
    final func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        origin.scrollViewWillBeginDragging?(scrollView)
    }
    
    final func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        origin.scrollViewWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    final func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        origin.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
    }
    
    final func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return origin.scrollViewShouldScrollToTop?(scrollView) ?? true
    }
    
    final func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        origin.scrollViewDidScrollToTop?(scrollView)
    }
    
    final func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        origin.scrollViewWillBeginDecelerating?(scrollView)
    }
    
    final func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        origin.scrollViewDidEndDecelerating?(scrollView)
    }
    
}

public extension UIScrollViewDelegateSplitting {
    
    final func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidScroll?(scrollView) }
    }
    
    final func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewWillBeginDragging?(scrollView) }
    }
    
    final func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        delegates.forEach { $0.scrollViewWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset) }
    }
    
    final func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegates.forEach { $0.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate) }
    }
    
    final func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        for delegate in delegates {
            if let result = delegate.scrollViewShouldScrollToTop?(scrollView) { return result }
        }
        return true
    }
    
    final func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidScrollToTop?(scrollView) }
    }
    
    final func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewWillBeginDecelerating?(scrollView) }
    }
    
    final func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidEndDecelerating?(scrollView) }
    }
    
}
