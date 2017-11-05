//
//  UITextFieldDelegateEditPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 05.11.17.
//

import UIKit

public final class UITextFieldDelegateEditPrinting: NSObject, UITextFieldDelegate {
    
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
