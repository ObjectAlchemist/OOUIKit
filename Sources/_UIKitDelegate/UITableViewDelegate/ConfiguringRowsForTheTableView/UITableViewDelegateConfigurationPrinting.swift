//
//  UITableViewDelegateConfigurationPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateConfigurationPrinting: NSObject, UITableViewDelegate {
    
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
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        printUI("\(filterKey)table heightForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, heightForRowAt: indexPath) ?? UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        printUI("\(filterKey)table estimatedHeightForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, estimatedHeightForRowAt: indexPath) ?? UITableViewAutomaticDimension
    }

    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        printUI("\(filterKey)table indentationLevelForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, indentationLevelForRowAt: indexPath) ?? 1
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        printUI("\(filterKey)table willDisplayCellForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        printUI("\(filterKey)table shouldSpringLoadRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, shouldSpringLoadRowAt: indexPath, with: context) ?? true
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
