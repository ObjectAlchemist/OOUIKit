//
//  UITableViewDataSourceConfigurationPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDataSourceConfigurationPrinting: NSObject, UITableViewDataSource {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(_ decorated: UITableViewDataSource, filterKey: String = "") {
        self.decorated = decorated
        // add space if exist to separate following log
        self.filterKey = filterKey.count == 0 ? "" : "\(filterKey) "
    }
    
    // MARK: - protocol: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        printUI("\(filterKey)table cellForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView(tableView, cellForRowAt: indexPath)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        printUI("\(filterKey)table numberOfSections called")
        return decorated.numberOfSections?(in: tableView) ?? 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        printUI("\(filterKey)table numberOfRowsInSection \(section) called")
        return decorated.tableView(tableView, numberOfRowsInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        printUI("\(filterKey)table titleForHeaderInSection \(section) called")
        return decorated.tableView?(tableView, titleForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        printUI("\(filterKey)table titleForFooterInSection \(section) called")
        return decorated.tableView?(tableView, titleForFooterInSection: section)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDataSource
    private let filterKey: String
    
}
