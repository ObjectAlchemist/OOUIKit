//
//  ImageCached.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 A decorator that limits the image creation/loading to one.
 */
public final class ImageCached: OOImage {
    
    // MARK: init

    public init(_ decorated: OOImage) {
        self.decorated = decorated
    }
    
    // MARK: protocol OOImage
    
    public var ui: UIImage {
        if _image == nil { _image = decorated.ui }
        return _image!
    }
    
    // MARK: private
    
    private let decorated: OOImage
    private var _image: UIImage?

}

// convenience initializer
public extension ImageCached {
    
    convenience init(_ decorated: UIImage) {
        self.init(ImageConst(decorated))
    }
    
}
