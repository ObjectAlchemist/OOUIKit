//
//  UIScrollViewDelegateScrollAnimation.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit
import OOBase

public final class UIScrollViewDelegateScrollAnimation: NSObject, UIScrollViewDelegate {
    
    // MARK: - init
    
    public init(
        didEndScrollingAnimation: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() }
        ) {
        self.didEndScrollingAnimation = didEndScrollingAnimation
        super.init()
    }
    
    // MARK: - protocol: UIScrollViewDelegate
    
    public final func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        didEndScrollingAnimation(scrollView).execute()
    }
    
    // MARK: - private
    
    private let didEndScrollingAnimation: (UIScrollView) -> OOExecutable
    
}
