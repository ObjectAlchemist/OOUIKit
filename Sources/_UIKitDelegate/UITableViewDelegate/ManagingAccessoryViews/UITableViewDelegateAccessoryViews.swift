//
//  UITableViewDelegateAccessoryViews.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDelegateAccessoryViews: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        editActionsForRow: @escaping (UITableView, IndexPath) -> [UITableViewRowAction]? = { _,_ in nil },
        accessoryButtonTapped: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in return DoNothing() }
        ) {
        self.editActionsForRow = editActionsForRow
        self.accessoryButtonTapped = accessoryButtonTapped
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return editActionsForRow(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        accessoryButtonTapped(tableView, indexPath).execute()
    }
    
    // MARK: - private
    
    private let editActionsForRow: (UITableView, IndexPath) -> [UITableViewRowAction]?
    private let accessoryButtonTapped: (UITableView, IndexPath) -> OOExecutable

}
