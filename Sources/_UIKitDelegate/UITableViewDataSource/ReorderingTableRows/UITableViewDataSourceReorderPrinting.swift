//
//  UITableViewDataSourceReorderPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDataSourceReorderPrinting: NSObject, UITableViewDataSource {
    
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
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey)table canMoveRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, canMoveRowAt: indexPath) ?? false
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        printUI("\(filterKey)table moveRowAt source=(\(sourceIndexPath.section)-\(sourceIndexPath.row)) destination=(\(destinationIndexPath.section)-\(destinationIndexPath.row))called")
        decorated.tableView?(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDataSource
    private let filterKey: String
    
}
