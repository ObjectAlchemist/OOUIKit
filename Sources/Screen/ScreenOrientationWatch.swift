//
//  ScreenOrientationWatch.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/** 
 A screen container that recognizes the display orientation by width to height comparison. 
 Use it to provide the content orientation to the childs.
 */
public final class ScreenOrientationWatch: OOScreen {
    
    // MARK: init
    
    public init(isLandscape: OOWritableBool, content: OOScreen) {
        self.isLandscape = isLandscape
        self.content = content
    }
    
    // MARK: protocol OOScreen
    
    public var ui: UIViewController {
        let isLandscape = self.isLandscape
        return OrientationRecognizingViewController(
            onChange: { DoWritableBoolSet($0, to: isLandscape) },
            content: content
        )
    }
    
    // MARK: private
    
    private let isLandscape: OOWritableBool
    private let content: OOScreen
    
}
