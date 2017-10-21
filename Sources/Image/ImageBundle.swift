//
//  ImageBundle.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/** 
 Creates an image from a bundle resource
 */
public final class ImageBundle: OOImage {
    
    // MARK: init
    
    public init(name: OOString, bundle: Bundle = Bundle.main) {
        self.name = name
        self.bundle = bundle
    }
    
    // MARK: protocol OOImage
    
    public var ui: UIImage {
        return UIImage(named: name.value, in: bundle, compatibleWith: nil)!
    }
    
    // MARK: private
    
    private let name: OOString
    private let bundle: Bundle
    
}

// convenience initializer
public extension ImageBundle {
    
    public convenience init(name: String, bundle: Bundle = Bundle.main) {
        self.init(name: StringConst(name), bundle: bundle)
    }
    
}
