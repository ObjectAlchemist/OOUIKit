//
//  UIScrollViewDelegateZoomPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 03.11.17.
//

import UIKit

public final class UIScrollViewDelegateZoomPrinting: NSObject, UIScrollViewDelegate {
    
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
    
    public final func scrollViewDidZoom(_ scrollView: UIScrollView) {
        printUI("\(filterKey)scrollview didZoom called")
        decorated.scrollViewDidZoom?(scrollView)
    }
    
    // MARK: - private
    
    private let decorated: UIScrollViewDelegate
    private let filterKey: String
    
}
