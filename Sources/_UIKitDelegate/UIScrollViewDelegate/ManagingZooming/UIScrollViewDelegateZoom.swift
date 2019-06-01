//
//  UIScrollViewDelegateZoom.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit
import OOBase

public final class UIScrollViewDelegateZoom: NSObject, UIScrollViewDelegate {
    
    // MARK: - init
    
    fileprivate init(
        viewForZooming: @escaping (UIScrollView) -> OOView? = { _ in nil },
        willBeginZooming: @escaping (UIScrollView, UIView?) -> OOExecutable = { _,_ in DoNothing() },
        didEndZooming: @escaping (UIScrollView, UIView?, CGFloat) -> OOExecutable = { _,_,_ in DoNothing() },
        didZoom: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() }
        ) {
        self.viewForZooming = viewForZooming
        self.willBeginZooming = willBeginZooming
        self.didEndZooming = didEndZooming
        self.didZoom = didZoom
        super.init()
    }
    
    // MARK: - protocol: UIScrollViewDelegate
    
    public final func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return viewForZooming(scrollView)?.ui
    }
    
    public final func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        willBeginZooming(scrollView, view).execute()
    }
    
    public final func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        didEndZooming(scrollView, view, scale).execute()
    }
    
    public final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        didZoom(scrollView).execute()
    }
    
    // MARK: - private
    
    private let viewForZooming: (UIScrollView) -> OOView?
    private let willBeginZooming: (UIScrollView, UIView?) -> OOExecutable
    private let didEndZooming: (UIScrollView, UIView?, CGFloat) -> OOExecutable
    private let didZoom: (UIScrollView) -> OOExecutable

}

public extension UIScrollViewDelegateZoom {
    
    convenience init(
        viewForZooming: @escaping (UIScrollView) -> OOView,
        willBeginZooming: @escaping (UIScrollView, UIView?) -> OOExecutable = { _,_ in DoNothing() },
        didEndZooming: @escaping (UIScrollView, UIView?, CGFloat) -> OOExecutable = { _,_,_ in DoNothing() },
        didZoom: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() }
        ) {
        let viewForZooming: (UIScrollView) -> OOView? = viewForZooming
        self.init(viewForZooming: viewForZooming, willBeginZooming: willBeginZooming, didEndZooming: didEndZooming, didZoom: didZoom)
    }
    
    convenience init(
        willBeginZooming: @escaping (UIScrollView, UIView?) -> OOExecutable = { _,_ in DoNothing() },
        didEndZooming: @escaping (UIScrollView, UIView?, CGFloat) -> OOExecutable = { _,_,_ in DoNothing() },
        didZoom: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() }
        ) {
        self.init(viewForZooming: { _ in nil }, willBeginZooming: willBeginZooming, didEndZooming: didEndZooming, didZoom: didZoom)
    }

}
