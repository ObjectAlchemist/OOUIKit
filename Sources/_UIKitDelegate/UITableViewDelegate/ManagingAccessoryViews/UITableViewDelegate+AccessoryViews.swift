//
//  UITableViewDelegate+AccessoryViews.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    final func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return origin.tableView?(tableView, editActionsForRowAt: indexPath)
    }
    
    final func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        origin.tableView?(tableView, accessoryButtonTappedForRowWith: indexPath)
    }
    
}

public extension UITableViewDelegateSplitting {
    
    final func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, editActionsForRowAt: indexPath) { return result }
        }
        return nil
    }
    
    final func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, accessoryButtonTappedForRowWith: indexPath) }
    }
    
}
