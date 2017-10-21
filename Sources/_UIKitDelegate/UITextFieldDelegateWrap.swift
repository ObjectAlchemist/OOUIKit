//
//  UITextFieldDelegateWrap.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public /*abstract*/ class UITextFieldDelegateWrap: NSObject, UITextFieldDelegate {
    
    // MARK: init
    
    public init(origin: UITextFieldDelegate) {
        self.origin = origin
    }
    
    // MARK: protocol UITextFieldDelegate
    
    public final func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    public final func textFieldDidBeginEditing(_ textField: UITextField) {
        origin.textFieldDidBeginEditing?(textField)
    }
    
    public final func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldEndEditing?(textField) ?? true
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField) {
        origin.textFieldDidEndEditing?(textField)
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        origin.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    public final func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return origin.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    public final func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldClear?(textField) ?? true
    }
    
    public final func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldReturn?(textField) ?? true
    }
    
    // MARK: private
    
    private let origin: UITextFieldDelegate
    
}
