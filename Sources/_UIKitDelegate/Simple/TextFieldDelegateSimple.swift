//
//  TextFieldDelegateSimple.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

public final class TextFieldDelegateSimple: NSObject, UITextFieldDelegate {
    
    // MARK: init
    
    convenience override init() {
        fatalError("Not supported!")
    }

    public init(
        shouldBeginEditing: @escaping (UITextField) -> OOBool = { _ in BoolConst(true) },
        didBeginEditing: @escaping (UITextField) -> OOExecutable = { _ in DoNothing() },
        shouldEndEditing: @escaping (UITextField) -> OOBool = { _ in BoolConst(true) },
        didEndEditing: @escaping (UITextField) -> OOExecutable = { _ in DoNothing() },
        didEndEditingReason: @escaping (UITextField, UITextFieldDidEndEditingReason) -> OOExecutable = { _,_ in DoNothing() },
        shouldChangeCharactersInRange: @escaping (UITextField, NSRange, String) -> OOBool = { _,_,_ in BoolConst(true) },
        shouldClear: @escaping (UITextField) -> OOBool = { _ in BoolConst(true) },
        shouldReturn: @escaping (UITextField) -> OOBool = { _ in BoolConst(true) }
        ) {
        self.shouldBeginEditing = shouldBeginEditing
        self.didBeginEditing = didBeginEditing
        self.shouldEndEditing = shouldEndEditing
        self.didEndEditing = didEndEditing
        self.didEndEditingReason = didEndEditingReason
        self.shouldChangeCharactersInRange = shouldChangeCharactersInRange
        self.shouldClear = shouldClear
        self.shouldReturn = shouldReturn
    }
    
    // MARK: protocol UITextFieldDelegate
    
    public final func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return shouldBeginEditing(textField).value
    }
    
    public final func textFieldDidBeginEditing(_ textField: UITextField) {
        didBeginEditing(textField).execute()
    }
    
    public final func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return shouldEndEditing(textField).value
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditing(textField).execute()
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        didEndEditingReason(textField, reason).execute()
    }
    
    public final func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return shouldChangeCharactersInRange(textField, range, string).value
    }
    
    public final func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return shouldClear(textField).value
    }
    
    public final func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return shouldReturn(textField).value
    }
    
    // MARK: private
    
    private let shouldBeginEditing: (UITextField) -> OOBool
    private let didBeginEditing: (UITextField) -> OOExecutable
    private let shouldEndEditing: (UITextField) -> OOBool
    private let didEndEditing: (UITextField) -> OOExecutable
    private let didEndEditingReason: (UITextField, UITextFieldDidEndEditingReason) -> OOExecutable
    private let shouldChangeCharactersInRange: (UITextField, NSRange, String) -> OOBool
    private let shouldClear: (UITextField) -> OOBool
    private let shouldReturn: (UITextField) -> OOBool
    
}
