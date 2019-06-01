//
//  UITableViewDelegate+SectionHeaderAndFooter.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    final func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return origin.tableView?(tableView, viewForHeaderInSection: section)
    }
    
    final func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return origin.tableView?(tableView, viewForFooterInSection: section)
    }
    
    final func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return origin.tableView?(tableView, heightForHeaderInSection: section) ?? 0
    }
    
    final func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return origin.tableView?(tableView, estimatedHeightForHeaderInSection: section) ?? 0
    }
    
    final func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return origin.tableView?(tableView, heightForFooterInSection: section) ?? 0
    }
    
    final func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return origin.tableView?(tableView, estimatedHeightForFooterInSection: section) ?? 0
    }
    
    final func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        origin.tableView?(tableView, willDisplayHeaderView: view, forSection: section)
    }
    
    final func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        origin.tableView?(tableView, willDisplayFooterView: view, forSection: section)
    }
    
}

public extension UITableViewDelegateSplitting {
    
    final func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, viewForHeaderInSection: section) { return result }
        }
        return nil
    }
    
    final func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, viewForFooterInSection: section) { return result }
        }
        return nil
    }
    
    final func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, heightForHeaderInSection: section) { return result }
        }
        return 0
    }
    
    final func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, estimatedHeightForHeaderInSection: section) { return result }
        }
        return 0
    }
    
    final func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, heightForFooterInSection: section) { return result }
        }
        return 0
    }
    
    final func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, estimatedHeightForFooterInSection: section) { return result }
        }
        return 0
    }
    
    final func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        delegates.forEach { $0.tableView?(tableView, willDisplayHeaderView: view, forSection: section) }
    }
    
    final func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        delegates.forEach { $0.tableView?(tableView, willDisplayFooterView: view, forSection: section) }
    }
    
}
