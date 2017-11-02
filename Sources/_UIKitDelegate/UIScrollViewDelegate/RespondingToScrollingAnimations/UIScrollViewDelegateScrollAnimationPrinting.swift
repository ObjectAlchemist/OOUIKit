//
//  UIScrollViewDelegateScrollAnimationPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit

public final class UIScrollViewDelegateScrollAnimationPrinting: NSObject, UIScrollViewDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(_ decorated: UIScrollViewDelegate, filterKey: String = "") {
        self.decorated = decorated
        // add space if exist to separate following log
        self.filterKey = filterKey.count == 0 ? "" : "\(filterKey) "
    }
    
    // MARK: - protocol: UIScrollViewDelegate
    
    public final func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview didEndScrollingAnimation called")
        decorated.scrollViewDidEndScrollingAnimation?(scrollView)
    }
    
    // MARK: - private
    
    private let decorated: UIScrollViewDelegate
    private let filterKey: String
    
}

