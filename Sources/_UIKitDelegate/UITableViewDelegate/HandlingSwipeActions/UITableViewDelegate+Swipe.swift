//
//  UITableViewDelegate+Swipe.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    public final func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return origin.tableView?(tableView, leadingSwipeActionsConfigurationForRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return origin.tableView?(tableView, trailingSwipeActionsConfigurationForRowAt: indexPath)
    }
    
}

public extension UITableViewDelegateSplitting {
    
    public final func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, leadingSwipeActionsConfigurationForRowAt: indexPath) { return result }
        }
        return nil
    }
    
    public final func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, trailingSwipeActionsConfigurationForRowAt: indexPath) { return result }
        }
        return nil
    }

}
