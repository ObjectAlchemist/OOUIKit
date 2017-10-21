//
//  OOBezierPath.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

// prefix: BezierPath
public protocol OOBezierPath: class {

    var ui: UIBezierPath { get }
    
}

public final class OOBezierPathFake: OOBezierPath {

    // MARK: - init
    
    public init(_ creator: @escaping () -> UIBezierPath = { UIBezierPath() }) {
        self.creator = creator
    }
    
    // MARK: - protocol: OOBezierPath
    
    public var ui: UIBezierPath {
        return creator()
    }
    
    // MARK: - private
    
    private let creator: () -> UIBezierPath
    
}

public /*abstract*/ class OOBezierPathWrap: OOBezierPath {
    
    // MARK: init
    
    public init(origin: OOBezierPath) {
        self.origin = origin
    }
    
    // MARK: protocol OOBezierPath
    
    public final var ui: UIBezierPath {
        return origin.ui
    }
    
    // MARK: private
    
    private let origin: OOBezierPath
    
}
