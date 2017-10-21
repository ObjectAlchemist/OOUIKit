//
//  TableViewDataSourcePrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 Use this decorator to log print outputs while development/debugging. Define a filterKey if you need a clear identification of this instance.
 For more informations see UIPrintOverload.swift
 */
public final class TableViewDataSourcePrinting: NSObject, UITableViewDataSource {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }

    public init(_ decorated: UITableViewDataSource, filterKey: String = "") {
        self.decorated = decorated
        self.filterKey = filterKey
    }
    
    // MARK: - protocol: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        printUI("\(filterKey) table numberOfRowsInSection \(section) called")
        return decorated.tableView(tableView, numberOfRowsInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        printUI("\(filterKey) table cellForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView(tableView, cellForRowAt: indexPath)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        printUI("\(filterKey) table numberOfSections called")
        return decorated.numberOfSections?(in: tableView) ?? 1
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        printUI("\(filterKey) table titleForHeaderInSection \(section) called")
        return decorated.tableView?(tableView, titleForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        printUI("\(filterKey) table titleForFooterInSection \(section) called")
        return decorated.tableView?(tableView, titleForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey) table canEditRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, canEditRowAt: indexPath) ?? false
    }
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey) table canMoveRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, canMoveRowAt: indexPath) ?? false
    }
    
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        printUI("\(filterKey) table sectionIndexTitles called")
        return decorated.sectionIndexTitles?(for: tableView)
    }
    
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        printUI("\(filterKey) table sectionForSectionIndexTitle \(title) at \(index) called")
        return decorated.tableView?(tableView, sectionForSectionIndexTitle: title, at: index) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        printUI("\(filterKey) table commitEditingStyle \(editingStyle.rawValue) (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        printUI("\(filterKey) table moveRowAt source=(\(sourceIndexPath.section)-\(sourceIndexPath.row)) destination=(\(destinationIndexPath.section)-\(destinationIndexPath.row))called")
        decorated.tableView?(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDataSource
    private let filterKey: String
    
}
