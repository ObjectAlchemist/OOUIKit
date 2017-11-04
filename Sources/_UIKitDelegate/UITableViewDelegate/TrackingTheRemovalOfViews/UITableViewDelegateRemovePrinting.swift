//
//  UITableViewDelegateRemovePrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateRemovePrinting: NSObject, UITableViewDelegate {
    
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
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        printUI("\(filterKey)table didEndDisplaying (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        printUI("\(filterKey)table didEndDisplayingHeaderView \(section) called")
        decorated.tableView?(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        printUI("\(filterKey)table didEndDisplayingFooterView \(section) called")
        decorated.tableView?(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
