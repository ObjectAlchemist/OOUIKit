//
//  ScrollViewDelegatePrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 Use this decorator to log print outputs while development/debugging. Define a filterKey if you need a clear identification of this instance.
 For more informations see UIPrintOverload.swift
 */
public final class ScrollViewDelegatePrinting: NSObject, UIScrollViewDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }

    public init(markedWith key: String = "", content: UIScrollViewDelegate) {
        // add space if exist to separate following log
        self.filterKey = key.characters.count == 0 ? "" : "\(key) "
        self.decorated = content
    }
    
    // MARK: - protocol: UIScrollViewDelegate
    
    public final func scrollViewDidScroll(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview didScroll called")
        decorated.scrollViewDidScroll?(scrollView)
    }
    
    public final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview didZoom called")
        decorated.scrollViewDidZoom?(scrollView)
    }
    
    public final func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview willBeginDragging called")
        decorated.scrollViewWillBeginDragging?(scrollView)
    }
    
    public final func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        printUI("\(filterKey)scrollview willEndDragging called (\n  velocity=\(velocity)\n  targetContentOffset=\(targetContentOffset)\n)")
        decorated.scrollViewWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    public final func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        printUI("\(filterKey)scrollview didEndDragging called (\n  decelerate=\(decelerate)\n)")
        decorated.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
    }
    
    public final func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview willBeginDecelerating called")
        decorated.scrollViewWillBeginDecelerating?(scrollView)
    }
    
    public final func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview didEndDecelerating called")
        decorated.scrollViewDidEndDecelerating?(scrollView)
    }
    
    public final func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview didEndScrollingAnimation called")
        decorated.scrollViewDidEndScrollingAnimation?(scrollView)
    }
    
    public final func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        printUI("\(filterKey)scrollview viewForZooming called")
        return decorated.viewForZooming?(in: scrollView)
    }
    
    public final func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        printUI("\(filterKey)scrollview willBeginZooming called (\n  view=\(String(describing: view))\n)")
        decorated.scrollViewWillBeginZooming?(scrollView, with: view)
    }
    
    public final func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        printUI("\(filterKey)scrollview didEndZooming called (\n  view=\(String(describing: view))\n  scale=\(scale)\n)")
        decorated.scrollViewDidEndZooming?(scrollView, with: view, atScale: scale)
    }
    
    public final func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        printUI("\(filterKey)scrollview shouldScrollToTop called")
        return decorated.scrollViewShouldScrollToTop?(scrollView) ?? true
    }
    
    public final func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview didScrollToTop called")
        decorated.scrollViewDidScrollToTop?(scrollView)
    }
    
    // MARK: - private
    
    private let decorated: UIScrollViewDelegate
    private let filterKey: String
    
}
