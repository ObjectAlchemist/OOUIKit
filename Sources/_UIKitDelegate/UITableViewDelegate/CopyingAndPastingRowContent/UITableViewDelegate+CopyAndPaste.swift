//
//  UITableViewDelegate+CopyAndPaste.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    final func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, shouldShowMenuForRowAt: indexPath) ?? false
    }
    
    final func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return origin.tableView?(tableView, canPerformAction: action, forRowAt: indexPath, withSender: sender) ?? false
    }
    
    final func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        origin.tableView?(tableView, performAction: action, forRowAt: indexPath, withSender: sender)
    }
    
}

public extension UITableViewDelegateSplitting {
    
    final func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, shouldShowMenuForRowAt: indexPath) { return result }
        }
        return false
    }
    
    final func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, canPerformAction: action, forRowAt: indexPath, withSender: sender) { return result }
        }
        return false
    }
    
    final func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        delegates.forEach { $0.tableView?(tableView, performAction: action, forRowAt: indexPath, withSender: sender) }
    }
    
}
