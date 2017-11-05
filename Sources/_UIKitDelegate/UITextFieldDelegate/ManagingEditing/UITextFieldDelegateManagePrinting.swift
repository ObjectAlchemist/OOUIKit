//
//  UITextFieldDelegateManagePrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 05.11.17.
//

import UIKit

public final class UITextFieldDelegateManagePrinting: NSObject, UITextFieldDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(_ decorated: UITextFieldDelegate, filterKey: String = "") {
        self.decorated = decorated
        // add space if exist to separate following log
        self.filterKey = filterKey.count == 0 ? "" : "\(filterKey) "
    }
    
    // MARK: - protocol: UITextFieldDelegate
    
    public final func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        printUI("\(filterKey)textfield shouldBeginEditing called")
        return decorated.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    public final func textFieldDidBeginEditing(_ textField: UITextField) {
        printUI("\(filterKey)textfield didBeginEditing called")
        decorated.textFieldDidBeginEditing?(textField)
    }
    
    public final func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        printUI("\(filterKey)textfield shouldEndEditing called")
        return decorated.textFieldShouldEndEditing?(textField) ?? true
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        printUI("\(filterKey)textfield didEndEditingReason called (\n  reason=\(reason.rawValue)\n)")
        decorated.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField) {
        printUI("\(filterKey)textfield didEndEditing called")
        decorated.textFieldDidEndEditing?(textField)
    }
    
    // MARK: - private
    
    private let decorated: UITextFieldDelegate
    private let filterKey: String
    
}

