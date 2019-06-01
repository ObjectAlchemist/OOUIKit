//
//  UITableViewDelegate+Highlight.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    final func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, shouldHighlightRowAt: indexPath) ?? true
    }
    
    final func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didHighlightRowAt: indexPath)
    }
    
    final func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didUnhighlightRowAt: indexPath)
    }
    
}

public extension UITableViewDelegateSplitting {
    
    final func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, shouldHighlightRowAt: indexPath) { return result }
        }
        return true
    }
    
    final func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, didHighlightRowAt: indexPath) }
    }
    
    final func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, didUnhighlightRowAt: indexPath) }
    }
    
}
