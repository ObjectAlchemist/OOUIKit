//
//  OOScreen.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

// prefix: Screen
public protocol OOScreen: class {

    var ui: UIViewController { get }

}

public final class OOScreenFake: OOScreen {

    // MARK: - init
    
    public init(_ creator: @escaping () -> UIViewController = { UIViewController() }) {
        self.creator = creator
    }
    
    // MARK: - protocol: OOScreen
    
    public var ui: UIViewController {
        return creator()
    }
    
    // MARK: - private
    
    private let creator: () -> UIViewController
    
}

public /*abstract*/ class OOScreenWrap: OOScreen {
    
    // MARK: init
    
    public init(origin: OOScreen) {
        self.origin = origin
    }
    
    // MARK: protocol OOScreen
    
    public final var ui: UIViewController {
        return origin.ui
    }
    
    // MARK: private
    
    private let origin: OOScreen
    
}
