//
//  ViewPrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public final class ViewPrinting: OOView {
    
    // MARK: - init
    
    public init(_ decorated: OOView, filterKey: String = "") {
        self.decorated = decorated
        // add space if exist to separate following log
        self.filterKey = filterKey.characters.count == 0 ? "" : "\(filterKey) "
    }
    
    // MARK: - protocol: OOView
    
    public var ui: UIView {
        let ui = decorated.ui
        printUI("\(filterKey)view created")
        return ui
    }

    public func setNeedsRefresh() {
        decorated.setNeedsRefresh()
        printUI("\(filterKey)view updated")
    }

    // MARK: - private
    
    private let decorated: OOView
    private let filterKey: String
    
}
