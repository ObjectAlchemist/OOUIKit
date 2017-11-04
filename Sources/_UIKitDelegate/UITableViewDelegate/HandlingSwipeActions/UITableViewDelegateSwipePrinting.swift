//
//  UITableViewDelegateSwipePrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateSwipePrinting: NSObject, UITableViewDelegate {
    
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
    
    public final func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        printUI("\(filterKey)table leadingSwipeActionsConfiguration (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, leadingSwipeActionsConfigurationForRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        printUI("\(filterKey)table trailingSwipeActionsConfiguration (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, trailingSwipeActionsConfigurationForRowAt: indexPath)
    }

    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
