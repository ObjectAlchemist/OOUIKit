//
//  UITableViewDelegateCopyAndPaste.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDelegateCopyAndPaste: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        shouldShowMenuForRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(false) },
        canPerformAction: @escaping (UITableView, Selector, IndexPath, Any?) -> OOBool = { _,_,_,_ in BoolConst(false) },
        performAction: @escaping (UITableView, Selector, IndexPath, Any?) -> OOExecutable = { _,_,_,_ in DoNothing() }
        ) {
        self.shouldShowMenuForRow = shouldShowMenuForRow
        self.canPerformAction = canPerformAction
        self.performAction = performAction
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return shouldShowMenuForRow(tableView, indexPath).value
    }
    
    public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return canPerformAction(tableView, action, indexPath, sender).value
    }
    
    public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        performAction(tableView, action, indexPath, sender).execute()
    }
    
    // MARK: - private
    
    private let shouldShowMenuForRow: (UITableView, IndexPath) -> OOBool
    private let canPerformAction: (UITableView, Selector, IndexPath, Any?) -> OOBool
    private let performAction: (UITableView, Selector, IndexPath, Any?) -> OOExecutable

}
