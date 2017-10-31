//
//  ScrollViewDelegateSplitting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 Sends the delegate events to all child delegates.
 Note: In case of functions with a return value the first delegate in list wins!
 */
public final class ScrollViewDelegateSplitting: NSObject, UIScrollViewDelegate {
    
    // MARK: init
    
    convenience override init() {
        fatalError("Not supported!")
    }

    public init(delegates: [UIScrollViewDelegate]) {
        guard delegates.count > 1 else { fatalError("A splitter only makes sense with 2 or more objects!") }
        self.delegates = delegates
    }
    
    // MARK: protocol UIScrollViewDelegate
    
    public final func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidScroll?(scrollView) }
    }
    
    public final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidZoom?(scrollView) }
    }
    
    public final func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewWillBeginDragging?(scrollView) }
    }
    
    public final func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        delegates.forEach { $0.scrollViewWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset) }
    }
    
    public final func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegates.forEach { $0.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate) }
    }
    
    public final func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewWillBeginDecelerating?(scrollView) }
    }
    
    public final func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidEndDecelerating?(scrollView) }
    }
    
    public final func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidEndScrollingAnimation?(scrollView) }
    }
    
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
    
    public final func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        for delegate in delegates {
            if let result = delegate.scrollViewShouldScrollToTop?(scrollView) { return result }
        }
        return true
    }
    
    public final func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        delegates.forEach { $0.scrollViewDidScrollToTop?(scrollView) }
    }
    
    // MARK: private
    
    private let delegates: [UIScrollViewDelegate]
    
}
