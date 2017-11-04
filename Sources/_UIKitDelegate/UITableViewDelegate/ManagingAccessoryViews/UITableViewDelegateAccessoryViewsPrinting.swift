//
//  UITableViewDelegateAccessoryViewsPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateAccessoryViewsPrinting: NSObject, UITableViewDelegate {
    
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
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        printUI("\(filterKey)table editActionForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, editActionsForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        printUI("\(filterKey)table accessoryButtonTappedForRowWith (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, accessoryButtonTappedForRowWith: indexPath)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
