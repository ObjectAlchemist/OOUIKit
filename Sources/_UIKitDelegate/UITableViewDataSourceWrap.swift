//
//  UITableViewDataSourceWrap.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public /*abstract*/ class UITableViewDataSourceWrap: NSObject, UITableViewDataSource {
    
    // MARK: init
    
    public init(origin: UITableViewDataSource) {
        self.origin = origin
    }
    
    // MARK: protocol UITableViewDataSource
    
    public final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return origin.tableView(tableView, numberOfRowsInSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return origin.tableView(tableView, cellForRowAt: indexPath)
    }
    
    public final func numberOfSections(in tableView: UITableView) -> Int {
        return origin.numberOfSections?(in: tableView) ?? 0
    }
    
    public final func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return origin.tableView?(tableView, titleForHeaderInSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return origin.tableView?(tableView, titleForHeaderInSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, canEditRowAt: indexPath) ?? false
    }
    
    public final func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, canMoveRowAt: indexPath) ?? false
    }
    
    public final func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return origin.sectionIndexTitles?(for: tableView)
    }
    
    public final func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return origin.tableView?(tableView, sectionForSectionIndexTitle: title, at: index) ?? 0
    }
    
    public final func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        origin.tableView?(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }
    
    // MARK: private
    
    private let origin: UITableViewDataSource
    
}
