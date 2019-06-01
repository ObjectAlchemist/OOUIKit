//
//  UITextFieldDelegateManage.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 05.11.17.
//

import UIKit
import OOBase

public final class UITextFieldDelegateManage: NSObject, UITextFieldDelegate {
    
    // MARK: - init
    
    public init(
        shouldBeginEditing: @escaping (UITextField) -> OOBool = { _ in BoolConst(true) },
        didBeginEditing: @escaping (UITextField) -> OOExecutable = { _ in DoNothing() },
        shouldEndEditing: @escaping (UITextField) -> OOBool = { _ in BoolConst(true) },
        didEndEditingReason: @escaping (UITextField, UITextField.DidEndEditingReason) -> OOExecutable = { _,_ in DoNothing() },
        didEndEditing: @escaping (UITextField) -> OOExecutable = { _ in DoNothing() }
        ) {
        self.shouldBeginEditing = shouldBeginEditing
        self.didBeginEditing = didBeginEditing
        self.shouldEndEditing = shouldEndEditing
        self.didEndEditingReason = didEndEditingReason
        self.didEndEditing = didEndEditing
        super.init()
    }
    
    // MARK: - protocol: UITextFieldDelegate
    
    public final func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return shouldBeginEditing(textField).value
    }
    
    public final func textFieldDidBeginEditing(_ textField: UITextField) {
        didBeginEditing(textField).execute()
    }
    
    public final func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return shouldEndEditing(textField).value
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        didEndEditingReason(textField, reason).execute()
    }

    public final func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditing(textField).execute()
    }
    
    // MARK: - private
    
    private let shouldBeginEditing: (UITextField) -> OOBool
    private let didBeginEditing: (UITextField) -> OOExecutable
    private let shouldEndEditing: (UITextField) -> OOBool
    private let didEndEditingReason: (UITextField, UITextField.DidEndEditingReason) -> OOExecutable
    private let didEndEditing: (UITextField) -> OOExecutable
    
}

