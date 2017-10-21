//
//  OOImage.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

// prefix: Image
public protocol OOImage: class {

    var ui: UIImage { get }

}

public final class OOImageFake: OOImage {

    // MARK: - init
    
    public init(_ creator: @escaping () -> UIImage = { UIImage() }) {
        self.creator = creator
    }
    
    // MARK: - protocol: OOImage
    
    public var ui: UIImage {
        return creator()
    }
    
    // MARK: - private
    
    private let creator: () -> UIImage
    
}

public /*abstract*/ class OOImageWrap: OOImage {
    
    // MARK: init
    
    public init(origin: OOImage) {
        self.origin = origin
    }
    
    // MARK: protocol OOImage
    
    public final var ui: UIImage {
        return origin.ui
    }
    
    // MARK: private
    
    private let origin: OOImage
    
}
