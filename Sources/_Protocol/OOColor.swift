//
//  OOColor.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

// prefix: Color
public protocol OOColor: class {

    var value: UIColor { get }
    
}

public final class OOColorFake: OOColor {

    // MARK: - init
    
    public init(_ creator: @escaping () -> UIColor = { .white }) {
        self.creator = creator
    }
    
    // MARK: - protocol: OOColor
    
    public var value: UIColor {
        return creator()
    }

    // MARK: - private
    
    private let creator: () -> UIColor
    
}

public /*abstract*/ class OOColorWrap: OOColor {
    
    // MARK: init
    
    public init(origin: OOColor) {
        self.origin = origin
    }
    
    // MARK: protocol OOColor
    
    public final var value: UIColor {
        return origin.value
    }
    
    // MARK: private
    
    private let origin: OOColor
    
}
