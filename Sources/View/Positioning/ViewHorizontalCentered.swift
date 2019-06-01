//
//  ViewHorizontalCentered.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A view container that present the content inside a vertical centered rectangle of fixed height.
 
 Visual:
        ---
         |
         |
 <centered content>
         |
         |
        ---
*/
public final class ViewHorizontalCentered: OOView {
    
    // MARK: init

    public init(height: OOFloat, content: OOView) {
        self.content = content
        self.height = height
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        content.setNeedsRefresh()
    }
    
    // MARK: private
    
    private let content: OOView
    private let height: OOFloat
    
    private func createView() -> UIView {
        let height = self.height.value
        guard height > 0 else { fatalError("A fixed height container needs a valid height!") }
        let container = PointInsideCheckingView()
        let contentView = content.ui
        contentView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(contentView)
        contentView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        contentView.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        return container
    }
    
}

// convenience initializer
public extension ViewHorizontalCentered {
    
    convenience init(height: Float, content: OOView) {
        self.init(height: FloatConst(height), content: content)
    }
    
}
