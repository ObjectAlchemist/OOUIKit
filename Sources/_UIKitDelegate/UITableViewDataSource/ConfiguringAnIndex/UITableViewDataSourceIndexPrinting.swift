//
//  UITableViewDataSourceIndexPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDataSourceIndexPrinting: NSObject, UITableViewDataSource {
    
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
    
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        printUI("\(filterKey)table sectionIndexTitles called")
        return decorated.sectionIndexTitles?(for: tableView)
    }
    
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        printUI("\(filterKey)table sectionForSectionIndexTitle \(title) at \(index) called")
        return decorated.tableView?(tableView, sectionForSectionIndexTitle: title, at: index) ?? 0
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDataSource
    private let filterKey: String
    
}
