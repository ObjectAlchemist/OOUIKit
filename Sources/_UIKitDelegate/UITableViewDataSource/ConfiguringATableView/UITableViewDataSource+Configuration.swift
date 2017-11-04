//
//  UITableViewDataSource+Configuration.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDataSourceWrap {
    
    public final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return origin.tableView(tableView, cellForRowAt: indexPath)
    }
    
    public final func numberOfSections(in tableView: UITableView) -> Int {
        return origin.numberOfSections?(in: tableView) ?? 1
    }
    
    public final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return origin.tableView(tableView, numberOfRowsInSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return origin.tableView?(tableView, titleForHeaderInSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return origin.tableView?(tableView, titleForHeaderInSection: section)
    }
    
}

public extension UITableViewDataSourceSplitting {
    
    public final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Note: the first delegate must be the implementer of this function!
        return delegates.first!.tableView(tableView, cellForRowAt: indexPath)
    }
    
    public final func numberOfSections(in tableView: UITableView) -> Int {
        for delegate in delegates {
            if let result = delegate.numberOfSections?(in: tableView) { return result }
        }
        return 1
    }
    
    public final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Note: the first delegate must be the implementer of this function!
        return delegates.first!.tableView(tableView, numberOfRowsInSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, titleForHeaderInSection: section) { return result }
        }
        return nil
    }
    
    public final func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, titleForFooterInSection: section) { return result }
        }
        return nil
    }
    
}
