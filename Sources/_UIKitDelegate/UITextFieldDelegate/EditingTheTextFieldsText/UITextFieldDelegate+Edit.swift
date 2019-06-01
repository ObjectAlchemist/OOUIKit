//
//  UITextFieldDelegate+Edit.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 05.11.17.
//

import UIKit

public extension UITextFieldDelegateWrap {
    
    final func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return origin.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    final func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldClear?(textField) ?? true
    }
    
    final func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return origin.textFieldShouldReturn?(textField) ?? true
    }
    
}

public extension UITextFieldDelegateSplitting {
    
    final func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        for delegate in delegates {
            if let result = delegate.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) { return result }
        }
        return true
    }
    
    final func textFieldShouldClear(_ textField: UITextField) -> Bool {
        for delegate in delegates {
            if let result = delegate.textFieldShouldClear?(textField) { return result }
        }
        return true
    }
    
    final func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for delegate in delegates {
            if let result = delegate.textFieldShouldReturn?(textField) { return result }
        }
        return true
    }
    
}
