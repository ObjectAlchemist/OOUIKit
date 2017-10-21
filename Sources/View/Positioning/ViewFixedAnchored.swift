//
//  ViewFixedAnchored.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A container with exactly four anchor values for positioning the content view.
 
 Visual:
  topleft (top+leading)         topright(top+trailing)
          ---                          ---
     |<content>--|                |--<content>|
     |     |     |                |     |     |
     |     |     |                |     |     |
          ---                          ---

  bottomleft (bottom+leading)   bottomright(bottom+trailing)
          ---                          ---
     |     |     |                |     |     |
     |     |     |                |     |     |
     |<content>--|                |--<content>|
          ---                          ---
 */
public final class ViewFixedAnchored: OOView {
    
    // MARK: init

    init(width: Float?, height: Float?, leading: Float?, trailing: Float?, top: Float?, bottom: Float?, content: OOView) {
        self.width = width
        self.height = height
        self.leading = leading
        self.trailing = trailing
        self.top = top
        self.bottom = bottom
        self.content = content
    }
    
    // MARK: protocol OOView
    
    private var _ui: UIView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        content.setNeedsRefresh()
        _ui?.setNeedsLayout()
    }
    
    // MARK: private
    
    private let width: Float?
    private let height: Float?
    private let leading: Float?
    private let trailing: Float?
    private let top: Float?
    private let bottom: Float?
    private let content: OOView
    
    private func createView() -> UIView {
        let view = PointInsideCheckingView()
        let content = self.content.ui
        content.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(content)
        if let width = self.width { content.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true }
        if let height = self.height { content.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true }
        if let top = self.top { content.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(top)).isActive = true }
        if let bottom = self.bottom { content.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat(bottom)).isActive = true }
        if let leading = self.leading { content.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(leading)).isActive = true }
        if let trailing = self.trailing { content.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(trailing)).isActive = true }
        return view
    }
    
}

// convenience initializer
public extension ViewFixedAnchored {
    
    public convenience init(leading: Float, trailing: Float, top: Float, bottom: Float, content: OOView) {
        self.init(width: nil, height: nil, leading: leading, trailing: trailing, top: top, bottom: bottom, content: content)
    }
    
    public convenience init(height: Float, leading: Float, trailing: Float, top: Float, content: OOView) {
        self.init(width: nil, height: height, leading: leading, trailing: trailing, top: top, bottom: nil, content: content)
    }
    
    public convenience init(height: Float, leading: Float, trailing: Float, bottom: Float, content: OOView) {
        self.init(width: nil, height: height, leading: leading, trailing: trailing, top: nil, bottom: bottom, content: content)
    }
    
    public convenience init(width: Float, leading: Float, top: Float, bottom: Float, content: OOView) {
        self.init(width: width, height: nil, leading: leading, trailing: nil, top: top, bottom: bottom, content: content)
    }
    
    public convenience init(width: Float, trailing: Float, top: Float, bottom: Float, content: OOView) {
        self.init(width: width, height: nil, leading: nil, trailing: trailing, top: top, bottom: bottom, content: content)
    }
    
    public convenience init(width: Float, height: Float, leading: Float, top: Float, content: OOView) {
        self.init(width: width, height: height, leading: leading, trailing: nil, top: top, bottom: nil, content: content)
    }
    
    public convenience init(width: Float, height: Float, leading: Float, bottom: Float, content: OOView) {
        self.init(width: width, height: height, leading: leading, trailing: nil, top: nil, bottom: bottom, content: content)
    }
    
    public convenience init(width: Float, height: Float, trailing: Float, top: Float, content: OOView) {
        self.init(width: width, height: height, leading: nil, trailing: trailing, top: top, bottom: nil, content: content)
    }
    
    public convenience init(width: Float, height: Float, trailing: Float, bottom: Float, content: OOView) {
        self.init(width: width, height: height, leading: nil, trailing: trailing, top: nil, bottom: bottom, content: content)
    }
    
}
