//
//  UITableViewDelegateFocusPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateFocusPrinting: NSObject, UITableViewDelegate {
    
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
    
    public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey)table canFocusRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, canFocusRowAt: indexPath) ?? false
    }
    
    public func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
        printUI("\(filterKey)table shouldUpdateFocusInContext called")
        return decorated.tableView?(tableView, shouldUpdateFocusIn: context) ?? false
    }
    
    public func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        printUI("\(filterKey)table didUpdateFocusInContext called")
        decorated.tableView?(tableView, didUpdateFocusIn: context, with: coordinator)
    }
    
    public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        printUI("\(filterKey)table indexPathForPreferredFocusedView called")
        return decorated.indexPathForPreferredFocusedView?(in: tableView)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
