//
//  FontConst.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public final class FontConst: OOFont {
    
    // MARK: - init
    
    public init(_ value: UIFont) {
        self.value = value
    }
    
    // MARK: - protocol: OOFont
    
    public let value: UIFont

    // MARK: - private
    
}
