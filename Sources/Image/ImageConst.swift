//
//  ImageConst.swift
//  OOSwift
//
//  Created by Karsten Litsche on 16.10.17.
//
//

import UIKit

public final class ImageConst: OOImage {
    
    // MARK: - init
    
    public init(_ value: UIImage) {
        self.ui = value
    }
    
    // MARK: - protocol: OOImage
    
    public let ui: UIImage
    
    // MARK: - private
    
}
