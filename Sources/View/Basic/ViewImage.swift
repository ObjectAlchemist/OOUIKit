//
//  ViewImage.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 A view displaying an image.
 */
public final class ViewImage: OOView {
    
    // MARK: init
    
    public init(image: OOImage) {
        self.image = image
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIImageView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        _ui?.image = image.ui
        _ui?.setNeedsLayout()
    }
    
    // MARK: private
    
    private let image: OOImage
    
    private func createView() -> UIImageView {
        let view = UIImageView(image: image.ui)
        view.isUserInteractionEnabled = true
        return view
    }
    
}
