//
//  UITableViewDataSourceConfiguration.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDataSourceConfiguration: NSObject, UITableViewDataSource {
    
    // MARK: - init
    
    public init(
        cellForRow: @escaping (UITableView, IndexPath) -> OOTableCell = { _,_ in TableCellDefault() },
        numberOfSections: @escaping (UITableView) -> OOInt = { _ in IntConst(1) },
        numberOfRows: @escaping (UITableView, Int) -> OOInt = { _,_ in IntConst(0) },
        titleForHeader: @escaping (UITableView, Int) -> OOString? = { _,_ in nil },
        titleForFooter: @escaping (UITableView, Int) -> OOString? = { _,_ in nil }
        ) {
        self.cellForRow = cellForRow
        self.numberOfSections = numberOfSections
        self.numberOfRows = numberOfRows
        self.titleForHeader = titleForHeader
        self.titleForFooter = titleForFooter
        super.init()
    }
    
    // MARK: - protocol: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRow(tableView, indexPath).configuredCell(for: tableView, at: indexPath)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections(tableView).value
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows(tableView, section).value
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeader(tableView, section)?.value
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return titleForFooter(tableView, section)?.value
    }
    
    // MARK: - private
    
    private let cellForRow: (UITableView, IndexPath) -> OOTableCell
    private let numberOfSections: (UITableView) -> OOInt
    private let numberOfRows: (UITableView, Int) -> OOInt
    private let titleForHeader: (UITableView, Int) -> OOString?
    private let titleForFooter: (UITableView, Int) -> OOString?
    
}
