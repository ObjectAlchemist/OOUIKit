//
//  ScreenColored.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/** 
 A screen container with a backgroundcolor. Typical used as a root screen for application background definition.
 It is good practice to have one colored background and add sub elements with transparent background.
 */
public final class ScreenColored: OOScreen {
    
    // MARK: init

    init(color: OOColor, optContent: OOScreen?) {
        self.color = color
        self.optContent = optContent
    }
    
    // MARK: protocol OOScreen
    
    public var ui: UIViewController {
        if let content = optContent {
            return ColorContainerViewController(color: color, content: content)
        } else {
            return SimpleViewController(content: ViewColored(), headerTitle: StringConst(""), contentSize: CGSize(width: 0, height: 0))
        }
    }
    
    // MARK: private
    
    private let color: OOColor
    private let optContent: OOScreen?
    
}

// convenience initializer
public extension ScreenColored {
    
    public convenience init(color: OOColor) {
        self.init(color: color, optContent: nil)
    }
    
    public convenience init(color: OOColor, content: OOScreen) {
        self.init(color: color, optContent: content)
    }
    
}
