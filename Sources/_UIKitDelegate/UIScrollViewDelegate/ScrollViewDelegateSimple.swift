//
//  ScrollViewDelegateSimple.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

final class ScrollViewDelegateSimple: NSObject, UIScrollViewDelegate {
    
    // MARK: init
    
    convenience override init() {
        fatalError("Not supported!")
    }

    public init(
        didScroll: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        didZoom: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        willBeginDragging: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        willEndDragging: @escaping (UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> OOExecutable = { _,_,_ in DoNothing() },
        didEndDragging: @escaping (UIScrollView, Bool) -> OOExecutable = { _,_ in DoNothing() },
        willBeginDecelerating: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        didEndDecelerating: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        didEndScrollingAnimation: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        viewForZooming: @escaping (UIScrollView) -> OOView? = { _ in nil },
        willBeginZooming: @escaping (UIScrollView, UIView?) -> OOExecutable = { _,_ in DoNothing() },
        didEndZooming: @escaping (UIScrollView, UIView?, CGFloat) -> OOExecutable = { _,_,_ in DoNothing() },
        shouldScrollToTop: @escaping (UIScrollView) -> OOBool = { _ in BoolConst(true) },
        didScrollToTop: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() }
        ) {
        self.didScroll = didScroll
        self.didZoom = didZoom
        self.willBeginDragging = willBeginDragging
        self.willEndDragging = willEndDragging
        self.didEndDragging = didEndDragging
        self.willBeginDecelerating = willBeginDecelerating
        self.didEndDecelerating = didEndDecelerating
        self.didEndScrollingAnimation = didEndScrollingAnimation
        self.viewForZooming = viewForZooming
        self.willBeginZooming = willBeginZooming
        self.didEndZooming = didEndZooming
        self.shouldScrollToTop = shouldScrollToTop
        self.didScrollToTop = didScrollToTop
    }
    
    // MARK: protocol UIScrollViewDelegate
    
    public final func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didScroll(scrollView).execute()
    }
    
    public final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        didZoom(scrollView).execute()
    }
    
    public final func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        willBeginDragging(scrollView).execute()
    }
    
    public final func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        willEndDragging(scrollView, velocity, targetContentOffset).execute()
    }
    
    public final func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        didEndDragging(scrollView, decelerate).execute()
    }
    
    public final func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        willBeginDecelerating(scrollView).execute()
    }
    
    public final func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        didEndDecelerating(scrollView).execute()
    }
    
    public final func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        didEndScrollingAnimation(scrollView).execute()
    }
    
    public final func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return viewForZooming(scrollView)?.ui
    }
    
    public final func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        willBeginZooming(scrollView, view).execute()
    }
    
    public final func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        didEndZooming(scrollView, view, scale).execute()
    }
    
    public final func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return shouldScrollToTop(scrollView).value
    }
    
    public final func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        didScrollToTop(scrollView).execute()
    }
    
    // MARK: private
    
    private let didScroll: (UIScrollView) -> OOExecutable
    private let didZoom: (UIScrollView) -> OOExecutable
    private let willBeginDragging: (UIScrollView) -> OOExecutable
    private let willEndDragging: (UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> OOExecutable
    private let didEndDragging: (UIScrollView, Bool) -> OOExecutable
    private let willBeginDecelerating: (UIScrollView) -> OOExecutable
    private let didEndDecelerating: (UIScrollView) -> OOExecutable
    private let didEndScrollingAnimation: (UIScrollView) -> OOExecutable
    private let viewForZooming: (UIScrollView) -> OOView?
    private let willBeginZooming: (UIScrollView, UIView?) -> OOExecutable
    private let didEndZooming: (UIScrollView, UIView?, CGFloat) -> OOExecutable
    private let shouldScrollToTop: (UIScrollView) -> OOBool
    private let didScrollToTop: (UIScrollView) -> OOExecutable
    
}
