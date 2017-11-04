//
//  UITableViewDelegateCopyAndPastePrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateCopyAndPastePrinting: NSObject, UITableViewDelegate {
    
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
    
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey)table shouldShowMenuForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, shouldShowMenuForRowAt: indexPath) ?? false
    }
    
    public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        printUI("\(filterKey)table canPerformActionForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, canPerformAction: action, forRowAt: indexPath, withSender: sender) ?? false
    }
    
    public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        printUI("\(filterKey)table performActionForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, performAction: action, forRowAt: indexPath, withSender: sender)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
