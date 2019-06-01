//
//  UITableViewDataSourceInsertAndDeletePrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDataSourceInsertAndDeletePrinting: NSObject, UITableViewDataSource {
    
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
        fatalError("This object do not provide configuration informations!")
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("This object do not provide configuration informations!")
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        printUI("\(filterKey)table commitEditingStyle \(editingStyle.rawValue) (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey)table canEditRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, canEditRowAt: indexPath) ?? false
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDataSource
    private let filterKey: String
    
}
