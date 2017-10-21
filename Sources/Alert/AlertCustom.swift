//
//  AlertCustom.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

public final class AlertCustom: OOAlert {
    
    // MARK: init
    
    public init(title: OOString, view: OOView) {
        self.title = title
        self.view = view
    }
    
    // MARK: protocol OOAlert
    
    public var ui: UIAlertController {
        let alert = UIAlertController(title: title.value, message: nil, preferredStyle: .alert)
        let view = self.view.ui
        view.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(view)
        view.topAnchor.constraint(equalTo: alert.view.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor).isActive = true
        return alert
    }
    
    // MARK: private
    
    private let title: OOString
    private let view: OOView
    
}

// convenience initializer
public extension AlertCustom {
    
    public convenience init(title: String = "", view: OOView) {
        self.init(title: StringConst(title), view: view)
    }
    
}
