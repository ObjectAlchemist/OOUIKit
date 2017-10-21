//
//  OOAlert.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

// prefix: Alert
public protocol OOAlert: class {

    var ui: UIAlertController { get }
    
}

public final class OOAlertFake: OOAlert {

    // MARK: - init
    
    public init(_ creator: @escaping () -> UIAlertController = { UIAlertController() }) {
        self.creator = creator
    }
    
    // MARK: - protocol: OOAlert
    
    public var ui: UIAlertController {
        return creator()
    }

    // MARK: - private
    
    private let creator: () -> UIAlertController
    
}

public /*abstract*/ class OOAlertWrap: OOAlert {
    
    // MARK: init
    
    public init(origin: OOAlert) {
        self.origin = origin
    }
    
    // MARK: protocol OOAlert
    
    public final var ui: UIAlertController {
        return origin.ui
    }
    
    // MARK: private
    
    private let origin: OOAlert
    
}
