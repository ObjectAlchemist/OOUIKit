//
//  ViewVerticalCentered.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A view container that present the content inside a horizontal centered rectangle of fixed width.
 
 Visual:
 |--<centered content>--|
 */
public final class ViewVerticalCentered: OOView {
    
    // MARK: init

    public init(width: OOFloat, content: OOView) {
        self.content = content
        self.width = width
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
    private let width: OOFloat
    
    private func createView() -> UIView {
        let width = self.width.value
        guard width > 0 else { fatalError("A fixed width container needs a valid width!") }
        let container = PointInsideCheckingView()
        let contentView = content.ui
        contentView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        contentView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        return container
    }
    
}

// convenience initializer
public extension ViewVerticalCentered {
    
    convenience init(width: Float, content: OOView) {
        self.init(width: FloatConst(width), content: content)
    }
    
}
