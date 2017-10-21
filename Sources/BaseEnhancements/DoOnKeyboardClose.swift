//
//  DoOnKeyboardClose.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 This action will listen for keyboard close event. When occur it will write 0 into keyboardHeight and execute the
 given action after that.
 */
public final class DoOnKeyboardClose: OOExecutable {
    
    // MARK: init
    
    public init(_ action: OOExecutable = DoNothing(), keyboardHeight: OOWritableFloat = FloatMemory(0), notificationCenter: NotificationCenter = .default) {
        self.action = action
        self.keyboardHeight = keyboardHeight
        self.notificationCenter = notificationCenter
    }
    
    deinit {
        if let notification = notification {
            NotificationCenter.default.removeObserver(notification)
        }
    }
    
    // MARK: protocol OOExecutable
    
    public func execute() {
        guard notification == nil else { fatalError("System notification adapter can only be executed once!") }
        let keyboardHeight = self.keyboardHeight
        let action = self.action
        notification = notificationCenter.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: .main) { _ in
            keyboardHeight.value = 0
            action.execute()
        }
    }
    
    // MARK: private
    
    private let action: OOExecutable
    private let keyboardHeight: OOWritableFloat
    private let notificationCenter: NotificationCenter
    private var notification: NSObjectProtocol?
    
}
