//
//  UITableViewDelegateEditPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateEditPrinting: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(_ decorated: UITableViewDelegate, filterKey: String = "") {
        self.decorated = decorated
        // add space if exist to separate following log
        self.filterKey = filterKey.count == 0 ? "" : "\(filterKey) "
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        printUI("\(filterKey)table willBeginEditingRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, willBeginEditingRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        printUI("\(filterKey)table didEndEditingRowAt (\(String(describing: indexPath?.section))-\(String(describing: indexPath?.row))) called")
        decorated.tableView?(tableView, didEndEditingRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        printUI("\(filterKey)table editingStyleForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, editingStyleForRowAt: indexPath) ?? .delete
    }
    
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        printUI("\(filterKey)table titleForDeleteConfirmationButtonForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey)table shouldIndentWhileEditingRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, shouldIndentWhileEditingRowAt: indexPath) ?? true
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
