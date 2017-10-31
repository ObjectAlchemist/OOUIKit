//
//  TextFieldDelegatePrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 14.10.17.
//
//

import UIKit

/**
 Use this decorator to log print outputs while development/debugging. Define a filterKey if you need a clear identification of this instance.
 For more informations see UIPrintOverload.swift
 */
public final class TextFieldDelegatePrinting: NSObject, UITextFieldDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(markedWith key: String = "", content: UITextFieldDelegate) {
        // add space if exist to separate following log
        self.filterKey = key.characters.count == 0 ? "" : "\(key) "
        self.decorated = content
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
    
    public final func textFieldDidEndEditing(_ textField: UITextField) {
        printUI("\(filterKey)textfield didEndEditing called")
        decorated.textFieldDidEndEditing?(textField)
    }
    
    public final func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        printUI("\(filterKey)textfield didEndEditingReason called (\n  reason=\(reason.rawValue)\n)")
        decorated.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    public final func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        printUI("\(filterKey)textfield shouldChangeCharactersInRange called (\n  range=\(range.location)/\(range.length)\n  string=\(string)\n)")
        return decorated.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    public final func textFieldShouldClear(_ textField: UITextField) -> Bool {
        printUI("\(filterKey)textfield shouldClear called")
        return decorated.textFieldShouldClear?(textField) ?? true
    }
    
    public final func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        printUI("\(filterKey)textfield shouldReturn called")
        return decorated.textFieldShouldReturn?(textField) ?? true
    }
    
    // MARK: - private
    
    private let decorated: UITextFieldDelegate
    private let filterKey: String
    
}
