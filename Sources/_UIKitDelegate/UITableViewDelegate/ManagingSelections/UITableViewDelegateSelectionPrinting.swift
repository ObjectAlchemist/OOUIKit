//
//  UITableViewDelegateSelectionPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateSelectionPrinting: NSObject, UITableViewDelegate {
    
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
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        printUI("\(filterKey)table willSelectRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, willSelectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        printUI("\(filterKey)table didSelectRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didSelectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        printUI("\(filterKey)table willDeselectRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, willDeselectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        printUI("\(filterKey)table didDeselectRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didDeselectRowAt: indexPath)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
