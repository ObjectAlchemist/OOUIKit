//
//  UITableViewDelegateEdit.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDelegateEdit: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        willBeginEditingRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        didEndEditingRow: @escaping (UITableView, IndexPath?) -> OOExecutable = { _,_ in DoNothing() },
        editingStyleForRow: @escaping (UITableView, IndexPath) -> UITableViewCell.EditingStyle = { _,_ in .delete },
        titleForDeleteConfirmationButtonForRow: @escaping (UITableView, IndexPath) -> OOString? = { _,_ in nil },
        shouldIndentWhileEditingRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(true) }
        ) {
        self.willBeginEditingRow = willBeginEditingRow
        self.didEndEditingRow = didEndEditingRow
        self.editingStyleForRow = editingStyleForRow
        self.titleForDeleteConfirmationButtonForRow = titleForDeleteConfirmationButtonForRow
        self.shouldIndentWhileEditingRow = shouldIndentWhileEditingRow
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        willBeginEditingRow(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        didEndEditingRow(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return editingStyleForRow(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return titleForDeleteConfirmationButtonForRow(tableView, indexPath)?.value
    }
    
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return shouldIndentWhileEditingRow(tableView, indexPath).value
    }
    
    // MARK: - private
    
    private let willBeginEditingRow: (UITableView, IndexPath) -> OOExecutable
    private let didEndEditingRow: (UITableView, IndexPath?) -> OOExecutable
    private let editingStyleForRow: (UITableView, IndexPath) -> UITableViewCell.EditingStyle
    private let titleForDeleteConfirmationButtonForRow: (UITableView, IndexPath) -> OOString?
    private let shouldIndentWhileEditingRow: (UITableView, IndexPath) -> OOBool

}
