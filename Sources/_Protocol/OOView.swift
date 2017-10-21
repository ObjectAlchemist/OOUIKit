//
//  OOView.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

// prefix: View
public protocol OOView: class {

    // var guranties the return of same instance every time!
    var ui: UIView { get }
    // will refresh the view if exist, use it to connect view updating mechanisms
    func setNeedsRefresh()
    
}

public final class OOViewFake: OOView {

    // MARK: - init
    
    public init(_ creator: @escaping () -> UIView = { UIView() }) {
        self.creator = creator
    }
    
    // MARK: - protocol: OOView
    
    private var _ui: UIView?
    public var ui: UIView {
        if _ui == nil { _ui = creator() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        _ui?.setNeedsLayout()
    }
    
    // MARK: - private
    
    private let creator: () -> UIView
    
}

open /*abstract*/ class OOViewWrap: OOView {
    
    // MARK: init
    
    public init(origin: OOView) {
        self.origin = origin
    }
    
    // MARK: protocol OOView
    
    public final var ui: UIView {
        return origin.ui
    }
    
    public final func setNeedsRefresh() {
        origin.setNeedsRefresh()
    }
    
    // MARK: private
    
    private let origin: OOView
    
}
