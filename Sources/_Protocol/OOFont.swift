//
//  OOFont.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

// prefix: Font
public protocol OOFont: class {

    var value: UIFont { get }
}

public final class OOFontFake: OOFont {

    // MARK: - init
    
    public init(_ creator: @escaping () -> UIFont = { .systemFont(ofSize: 12) }) {
        self.creator = creator
    }
    
    // MARK: - protocol: OOFont
    
    public var value: UIFont {
        return creator()
    }
    
    // MARK: - private
    
    private let creator: () -> UIFont
    
}

open /*abstract*/ class OOFontWrap: OOFont {
    
    // MARK: init
    
    public init(origin: OOFont) {
        self.origin = origin
    }
    
    // MARK: protocol OOFont
    
    public final var value: UIFont {
        return origin.value
    }
    
    // MARK: private
    
    private let origin: OOFont
    
}
