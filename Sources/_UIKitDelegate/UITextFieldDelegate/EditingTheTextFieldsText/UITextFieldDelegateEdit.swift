//
//  UITextFieldDelegateEdit.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 05.11.17.
//

import UIKit
import OOBase

public final class UITextFieldDelegateEdit: NSObject, UITextFieldDelegate {
    
    // MARK: - init
    
    public init(
        shouldChangeCharactersInRange: @escaping (UITextField, NSRange, String) -> OOBool = { _,_,_ in BoolConst(true) },
        shouldClear: @escaping (UITextField) -> OOBool = { _ in BoolConst(true) },
        shouldReturn: @escaping (UITextField) -> OOBool = { _ in BoolConst(true) }
        ) {
        self.shouldChangeCharactersInRange = shouldChangeCharactersInRange
        self.shouldClear = shouldClear
        self.shouldReturn = shouldReturn
        super.init()
    }
    
    // MARK: - protocol: UITextFieldDelegate
    
    public final func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return shouldChangeCharactersInRange(textField, range, string).value
    }
    
    public final func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return shouldClear(textField).value
    }
    
    public final func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return shouldReturn(textField).value
    }
    
    // MARK: - private
    
    private let shouldChangeCharactersInRange: (UITextField, NSRange, String) -> OOBool
    private let shouldClear: (UITextField) -> OOBool
    private let shouldReturn: (UITextField) -> OOBool
    
}
