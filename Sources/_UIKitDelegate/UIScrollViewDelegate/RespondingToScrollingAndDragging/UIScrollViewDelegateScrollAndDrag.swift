//
//  UIScrollViewDelegateScrollAndDrag.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit
import OOBase

public final class UIScrollViewDelegateScrollAndDrag: NSObject, UIScrollViewDelegate {
    
    // MARK: - init
    
    public init(
        didScroll: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        willBeginDragging: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        willEndDragging: @escaping (UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> OOExecutable = { _,_,_ in DoNothing() },
        didEndDragging: @escaping (UIScrollView, Bool) -> OOExecutable = { _,_ in DoNothing() },
        shouldScrollToTop: @escaping (UIScrollView) -> OOBool = { _ in BoolConst(true) },
        didScrollToTop: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        willBeginDecelerating: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() },
        didEndDecelerating: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() }
        ) {
        self.didScroll = didScroll
        self.willBeginDragging = willBeginDragging
        self.willEndDragging = willEndDragging
        self.didEndDragging = didEndDragging
        self.shouldScrollToTop = shouldScrollToTop
        self.didScrollToTop = didScrollToTop
        self.willBeginDecelerating = willBeginDecelerating
        self.didEndDecelerating = didEndDecelerating
        super.init()
    }
    
    // MARK: - protocol: UIScrollViewDelegate
    
    public final func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didScroll(scrollView).execute()
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
    
    public final func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return shouldScrollToTop(scrollView).value
    }
    
    public final func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        didScrollToTop(scrollView).execute()
    }
    
    public final func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        willBeginDecelerating(scrollView).execute()
    }
    
    public final func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        didEndDecelerating(scrollView).execute()
    }
    
    // MARK: - private
    
    private let didScroll: (UIScrollView) -> OOExecutable
    private let willBeginDragging: (UIScrollView) -> OOExecutable
    private let willEndDragging: (UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> OOExecutable
    private let didEndDragging: (UIScrollView, Bool) -> OOExecutable
    private let shouldScrollToTop: (UIScrollView) -> OOBool
    private let didScrollToTop: (UIScrollView) -> OOExecutable
    private let willBeginDecelerating: (UIScrollView) -> OOExecutable
    private let didEndDecelerating: (UIScrollView) -> OOExecutable
    
}
