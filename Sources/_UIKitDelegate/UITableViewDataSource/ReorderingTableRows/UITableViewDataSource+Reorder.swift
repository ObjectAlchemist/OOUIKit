//
//  UITableViewDataSource+Reorder.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDataSourceWrap {
    
    final func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, canMoveRowAt: indexPath) ?? false
    }
    
    final func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        origin.tableView?(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }
    
}

public extension UITableViewDataSourceSplitting {
    
    final func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, canMoveRowAt: indexPath) { return result }
        }
        return false
    }
    
    final func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath) }
    }
    
}
