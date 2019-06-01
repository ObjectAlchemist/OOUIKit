//
//  UITableViewDataSource+InsertAndDelete.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDataSourceWrap {
    
    final func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    
    final func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, canEditRowAt: indexPath) ?? false
    }
    
}

public extension UITableViewDataSourceSplitting {

    final func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, commit: editingStyle, forRowAt: indexPath) }
    }
    
    final func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, canEditRowAt: indexPath) { return result }
        }
        return false
    }
    
}
