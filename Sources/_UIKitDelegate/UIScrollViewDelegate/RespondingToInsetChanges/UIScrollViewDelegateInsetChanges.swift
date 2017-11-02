//
//  UIScrollViewDelegateInsetChanges.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit
import OOBase

public final class UIScrollViewDelegateInsetChanges: NSObject, UIScrollViewDelegate {
    
    // MARK: - init
    
    public init(
        didChangeAdjustedContentInset: @escaping (UIScrollView) -> OOExecutable = { _ in DoNothing() }
        ) {
        self.didChangeAdjustedContentInset = didChangeAdjustedContentInset
        super.init()
    }
    
    // MARK: - protocol: UIScrollViewDelegate
    
    public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        didChangeAdjustedContentInset(scrollView).execute()
    }

    // MARK: - private
    
    private let didChangeAdjustedContentInset: (UIScrollView) -> OOExecutable
    
}
