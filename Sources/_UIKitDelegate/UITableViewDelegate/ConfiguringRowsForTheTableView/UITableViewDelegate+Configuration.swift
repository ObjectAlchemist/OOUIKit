//
//  UITableViewDelegate+Configuration.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    public final func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return origin.tableView?(tableView, heightForRowAt: indexPath) ?? UITableViewAutomaticDimension
    }
    
    public final func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return origin.tableView?(tableView, estimatedHeightForRowAt: indexPath) ?? UITableViewAutomaticDimension
    }
    
    public final func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return origin.tableView?(tableView, indentationLevelForRowAt: indexPath) ?? 1
    }
    
    public final func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        return origin.tableView?(tableView, shouldSpringLoadRowAt: indexPath, with: context) ?? true
    }
    
}

public extension UITableViewDelegateSplitting {
    
    public final func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, heightForRowAt: indexPath) { return result }
        }
        return UITableViewAutomaticDimension
    }
    
    public final func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, estimatedHeightForRowAt: indexPath) { return result }
        }
        return UITableViewAutomaticDimension
    }
    
    public final func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, indentationLevelForRowAt: indexPath) { return result }
        }
        return 1
    }
    
    public final func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, willDisplay: cell, forRowAt: indexPath) }
    }
    
    public final func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, shouldSpringLoadRowAt: indexPath, with: context) { return result }
        }
        return true
    }

}
