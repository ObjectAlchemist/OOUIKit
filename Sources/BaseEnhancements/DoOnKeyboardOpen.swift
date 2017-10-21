//
//  DoOnKeyboardOpen.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 This action will listen for keyboard open event. When occur it will write the keyboard height into keyboardHeight and execute the
 given action after that.
 */
public final class DoOnKeyboardOpen: OOExecutable {
    
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
        notification = notificationCenter.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: .main) { notification in
            let keyboardRect = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
            keyboardHeight.value = Float(keyboardRect.cgRectValue.size.height)
            action.execute()
        }
    }
    
    // MARK: private
    
    private let action: OOExecutable
    private let keyboardHeight: OOWritableFloat
    private let notificationCenter: NotificationCenter
    private var notification: NSObjectProtocol?
    
}
