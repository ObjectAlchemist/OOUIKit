//
//  UITextFieldDelegate+Manage.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 05.11.17.
//

import UIKit

public extension UITextFieldDelegateWrap {
    
    public final func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    public final func textFieldDidBeginEditing(_ textField: UITextField) {
        origin.textFieldDidBeginEditing?(textField)
    }
    
    public final func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldEndEditing?(textField) ?? true
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        origin.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField) {
        origin.textFieldDidEndEditing?(textField)
    }
    
}

public extension UITextFieldDelegateSplitting {
    
    public final func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        for delegate in delegates {
            if let result = delegate.textFieldShouldBeginEditing?(textField) { return result }
        }
        return true
    }
    
    public final func textFieldDidBeginEditing(_ textField: UITextField) {
        delegates.forEach { $0.textFieldDidBeginEditing?(textField) }
    }
    
    public final func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        for delegate in delegates {
            if let result = delegate.textFieldShouldEndEditing?(textField) { return result }
        }
        return true
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        delegates.forEach { $0.textFieldDidEndEditing?(textField, reason: reason) }
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField) {
        delegates.forEach { $0.textFieldDidEndEditing?(textField) }
    }
    
}
