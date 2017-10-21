//
//  DoUpdateView.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import OOBase

public final class DoUpdateView: OOExecutable {
    
    // MARK: init
    
    public init(_ view: OOView) {
        self.view = view
    }
    
    // MARK: protocol OOExecutable
    
    public func execute() {
        view.setNeedsRefresh()
    }
    
    // MARK: private
    
    private let view: OOView
    
}
