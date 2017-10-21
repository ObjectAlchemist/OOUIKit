//
//  ViewImageButton.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase
import OOFoundation

/**
 A view displaying an image button with an action.
 When trigger the button interaction after deallocating this object it will crash (objc compatibility issue)!
 
 Hint: Use edgeInsets e.g. UIEdgeInsets(10, 10, 10. 10) to shorten image draw area. This results in a larger tap area.
 */
public final class ViewImageButton: OOView {
    
    // MARK: init
    
    public init(image: OOImage, action: OOExecutable, tintColor: OOColor, edgeInsets: UIEdgeInsets = UIEdgeInsets.zero) {
        self.image = image
        self.action = DoObjC(action) // encapsulate it so we can use it as selector
        self.tintColor = tintColor
        self.edgeInsets = edgeInsets
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIButton?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        if _ui != nil { update(button: _ui!) }
        _ui?.setNeedsLayout()
    }
    
    // MARK: private
    
    private let image: OOImage
    private let action: DoObjC
    private let tintColor: OOColor
    private let edgeInsets: UIEdgeInsets

    private func createView() -> UIButton {
        let button = UIButton(type: .custom)
        button.addTarget(action, action: #selector(DoObjC.execute), for: .touchUpInside)
        button.imageEdgeInsets = edgeInsets
        update(button: button)
        return button
    }
    
    private func update(button: UIButton) {
        button.setImage(image.ui, for: .normal)
        button.tintColor = tintColor.value // if not set, self defined image will be blue
    }
    
}
