//
//  ScreenKeyboardResize.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/*
 This screen container reduces the height of the content screen when keyboard opens and increase it again when keyboard close.
 The autolayout of the contained screen should rearange the views then automatically.
 
 Note: If UI jumps between screens add following to the content screen:
 override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     view.endEditing(true)
 }
 */
public final class ScreenKeyboardResize: OOScreen {
    
    // MARK: init
    
    public init(content: OOScreen) {
        self.content = content
    }

    // MARK: protocol OOScreen
    
    public var ui: UIViewController {
        let keyboardHeight = WritableFloatMemory(0)
        let controller = ReduceHeightViewController(content: content, bottomGap: keyboardHeight)
        let updateUI = DoGenericSnippet { [weak controller] in controller?.updateBottomGap() }
        openAction = DoOnKeyboardOpen(updateUI, keyboardHeight: keyboardHeight)
        closeAction = DoOnKeyboardClose(updateUI, keyboardHeight: keyboardHeight)
        openAction?.execute()
        closeAction?.execute()
        return controller
    }
    
    // MARK: private
    
    private let content: OOScreen
    private var openAction: OOExecutable?
    private var closeAction: OOExecutable?

}
