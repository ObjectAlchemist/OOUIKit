//
//  UITableViewDelegate+Selection.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    public final func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return origin.tableView?(tableView, willSelectRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didSelectRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return origin.tableView?(tableView, willDeselectRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didDeselectRowAt: indexPath)
    }
    
}

public extension UITableViewDelegateSplitting {
    
    public final func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, willSelectRowAt: indexPath) { return result }
        }
        return nil
    }
    
    public final func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, didSelectRowAt: indexPath) }
    }
    
    public final func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, willDeselectRowAt: indexPath) { return result }
        }
        return nil
    }
    
    public final func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, didDeselectRowAt: indexPath) }
    }
    
}
