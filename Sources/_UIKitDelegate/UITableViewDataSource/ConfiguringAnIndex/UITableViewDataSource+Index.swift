//
//  UITableViewDataSource+Index.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDataSourceWrap {
    
    public final func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return origin.sectionIndexTitles?(for: tableView)
    }
    
    public final func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return origin.tableView?(tableView, sectionForSectionIndexTitle: title, at: index) ?? 0
    }

}

public extension UITableViewDataSourceSplitting {
    
    public final func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        for delegate in delegates {
            if let result = delegate.sectionIndexTitles?(for: tableView) { return result }
        }
        return nil
    }
    
    public final func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, sectionForSectionIndexTitle: title, at: index) { return result }
        }
        return 0
    }

}
