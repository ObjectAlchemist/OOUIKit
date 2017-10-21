//
//  ViewConst.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public final class ViewConst: OOView {
    
    // MARK: init
    
    public init(_ view: UIView) {
        self.ui = view
    }
    
    // MARK: protocol OOView
    
    public let ui: UIView
    
    public func setNeedsRefresh() {
        ui.setNeedsLayout()
    }
    
    // MARK: private
    
}
