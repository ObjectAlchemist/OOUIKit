//
//  UIScrollViewDelegateInsetChangesPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit

public final class UIScrollViewDelegateInsetChangesPrinting: NSObject, UIScrollViewDelegate {
    
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
    
    public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview didChangeAdjustedContentInset called")
        decorated.scrollViewDidChangeAdjustedContentInset?(scrollView)
    }

    // MARK: - private
    
    private let decorated: UIScrollViewDelegate
    private let filterKey: String
    
}

