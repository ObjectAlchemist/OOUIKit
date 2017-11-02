//
//  DoSetScreenFlow.swift
//  OOSwift
//
//  Created by Karsten Litsche on 28.10.17.
//  
//

import UIKit
import OOBase

/** Connects the screen flow with the UIApplication. Use it in your UIApplicationDelegateWrap. */
public final class DoSetScreenFlow: OOExecutable {
    
    // MARK: - init
    
    public init(application: UIApplication, screenFlow: OOScreen) {
        self.application = application
        self.screenFlow = screenFlow
    }
    
    // MARK: - protocol: OOExecutable
    
    public func execute() {
        let window = application.delegate!.window!!
        window.rootViewController = screenFlow.ui
        window.makeKeyAndVisible()
    }
    
    // MARK: - private
    
    private let application: UIApplication
    private let screenFlow: OOScreen
    
}
