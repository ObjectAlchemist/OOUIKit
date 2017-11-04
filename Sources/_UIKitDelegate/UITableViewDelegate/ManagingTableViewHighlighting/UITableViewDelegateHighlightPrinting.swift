//
//  UITableViewDelegateHighlightPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateHighlightPrinting: NSObject, UITableViewDelegate {
    
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
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey)table shouldHighlightRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, shouldHighlightRowAt: indexPath) ?? true
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        printUI("\(filterKey)table didHighlightRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didHighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        printUI("\(filterKey)table didUnhighlightRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didUnhighlightRowAt: indexPath)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
