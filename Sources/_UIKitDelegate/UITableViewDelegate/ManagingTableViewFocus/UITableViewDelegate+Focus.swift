//
//  UITableViewDelegate+Focus.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    final func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, canFocusRowAt: indexPath) ?? false
    }
    
    final func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
        return origin.tableView?(tableView, shouldUpdateFocusIn: context) ?? false
    }
    
    final func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        origin.tableView?(tableView, didUpdateFocusIn: context, with: coordinator)
    }
    
    final func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        return origin.indexPathForPreferredFocusedView?(in: tableView)
    }
    
}

public extension UITableViewDelegateSplitting {
    
    final func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, canFocusRowAt: indexPath) { return result }
        }
        return false
    }
    
    final func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, shouldUpdateFocusIn: context) { return result }
        }
        return false
    }
    
    final func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        delegates.forEach { $0.tableView?(tableView, didUpdateFocusIn: context, with: coordinator) }
    }
    
    final func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        for delegate in delegates {
            if let result = delegate.indexPathForPreferredFocusedView?(in: tableView) { return result }
        }
        return nil
    }
    
}
