//
//  UITextFieldDelegate+Manage.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 05.11.17.
//

import UIKit

public extension UITextFieldDelegateWrap {
    
    final func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    final func textFieldDidBeginEditing(_ textField: UITextField) {
        origin.textFieldDidBeginEditing?(textField)
    }
    
    final func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldEndEditing?(textField) ?? true
    }
    
    final func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        origin.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    final func textFieldDidEndEditing(_ textField: UITextField) {
        origin.textFieldDidEndEditing?(textField)
    }
    
}

public extension UITextFieldDelegateSplitting {
    
    final func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        for delegate in delegates {
            if let result = delegate.textFieldShouldBeginEditing?(textField) { return result }
        }
        return true
    }
    
    final func textFieldDidBeginEditing(_ textField: UITextField) {
        delegates.forEach { $0.textFieldDidBeginEditing?(textField) }
    }
    
    final func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        for delegate in delegates {
            if let result = delegate.textFieldShouldEndEditing?(textField) { return result }
        }
        return true
    }
    
    final func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        delegates.forEach { $0.textFieldDidEndEditing?(textField, reason: reason) }
    }
    
    final func textFieldDidEndEditing(_ textField: UITextField) {
        delegates.forEach { $0.textFieldDidEndEditing?(textField) }
    }
    
}
