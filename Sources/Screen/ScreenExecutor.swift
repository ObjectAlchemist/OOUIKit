//
//  ScreenExecutor.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A screen container for another screen with the ability to do something the contained screen shouldn't know about.
 Usage examples:
 - If you need to start a background process
 - If you need to assign & own a delegate for a CBCentralManager
 */
public final class ScreenExecutor: OOScreen {
    
    // MARK: init
    
    public init(content: OOScreen, willCreate: OOExecutable = DoNothing(), didCreate: OOExecutable = DoNothing(), willDestroy: OOExecutable = DoNothing()) {
        self.content = content
        self.willCreate = willCreate
        self.didCreate = didCreate
        self.willDestroy = willDestroy
    }
    
    // MARK: protocol OOScreen
    
    public var ui: UIViewController {
        return ContentContainerViewController(content: content, willCreate: willCreate, didCreate: didCreate, willDestroy: willDestroy)
    }
    
    // MARK: private
    
    private let content: OOScreen
    private let willCreate: OOExecutable
    private var didCreate: OOExecutable
    private let willDestroy: OOExecutable
    
}
