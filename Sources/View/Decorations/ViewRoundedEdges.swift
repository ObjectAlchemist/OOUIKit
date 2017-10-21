//
//  ViewRoundedEdges.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

public final class ViewRoundedEdges: OOView {
    
    // MARK: init

    public init(cornerRadius: OOFloat, content decorated: OOView) {
        self.cornerRadius = cornerRadius
        self.decorated = decorated
    }
    
    // MARK: protocol OOView
    
    public var ui: UIView {
        let ui = decorated.ui
        ui.layer.masksToBounds = true
        ui.layer.cornerRadius = CGFloat(cornerRadius.value)
        return ui
    }
    
    public func setNeedsRefresh() {
        decorated.setNeedsRefresh()
    }
    
    // MARK: private
    
    private let cornerRadius: OOFloat
    private let decorated: OOView
    
}

// convenience initializer
public extension ViewRoundedEdges {
    
    public convenience init(cornerRadius: Float, content decorated: OOView) {
        self.init(cornerRadius: FloatConst(cornerRadius), content: decorated)
    }
    
}
