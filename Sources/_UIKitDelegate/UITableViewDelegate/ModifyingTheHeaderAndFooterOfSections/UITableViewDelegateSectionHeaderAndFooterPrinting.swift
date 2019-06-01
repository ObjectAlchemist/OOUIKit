//
//  UITableViewDelegateSectionHeaderAndFooterPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateSectionHeaderAndFooterPrinting: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(_ decorated: UITableViewDelegate, filterKey: String = "") {
        self.decorated = decorated
        // add space if exist to separate following log
        self.filterKey = filterKey.count == 0 ? "" : "\(filterKey) "
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        printUI("\(filterKey)table viewForHeaderInSection \(section) called")
        return decorated.tableView?(tableView, viewForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        printUI("\(filterKey)table viewForFooterInSection \(section) called")
        return decorated.tableView?(tableView, viewForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        printUI("\(filterKey)table heightForHeaderInSection \(section) called")
        return decorated.tableView?(tableView, heightForHeaderInSection: section) ?? UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        printUI("\(filterKey)table estimatedHeightForHeaderInSection \(section) called")
        return decorated.tableView?(tableView, estimatedHeightForHeaderInSection: section) ?? UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        printUI("\(filterKey)table heightForFooterInSection \(section) called")
        return decorated.tableView?(tableView, heightForFooterInSection: section) ?? UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        printUI("\(filterKey)table estimatedHeightForFooterInSection \(section) called")
        return decorated.tableView?(tableView, estimatedHeightForFooterInSection: section) ?? UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        printUI("\(filterKey)table willDisplayHeaderView \(section) called")
        decorated.tableView?(tableView, willDisplayHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        printUI("\(filterKey)table willDisplayFooterView \(section) called")
        decorated.tableView?(tableView, willDisplayFooterView: view, forSection: section)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
