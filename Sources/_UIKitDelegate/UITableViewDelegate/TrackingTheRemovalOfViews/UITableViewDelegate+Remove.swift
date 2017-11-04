//
//  UITableViewDelegate+Remove.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    public final func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        origin.tableView?(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        origin.tableView?(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
}

public extension UITableViewDelegateSplitting {
    
    public final func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath) }
    }
    
    public final func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        delegates.forEach { $0.tableView?(tableView, didEndDisplayingHeaderView: view, forSection: section) }
    }
    
    public final func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        delegates.forEach { $0.tableView?(tableView, didEndDisplayingFooterView: view, forSection: section) }
    }
    
}
