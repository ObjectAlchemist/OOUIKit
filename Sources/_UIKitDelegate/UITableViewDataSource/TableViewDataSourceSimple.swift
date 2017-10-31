//
//  TableViewDataSourceSimple.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

public final class TableViewDataSourceSimple: NSObject, UITableViewDataSource {
    
    // MARK: init
    
    convenience override init() {
        fatalError("Not supported!")
    }

    public init(
        numberOfRows: @escaping (UITableView, Int) -> OOInt = { _,_ in IntConst(0) },
        cellForRow: @escaping (UITableView, IndexPath) -> OOTableCell = { _,_ in TableCellDefault() },
        numberOfSections: @escaping (UITableView) -> OOInt = { _ in IntConst(1) },
        titleForHeader: @escaping (UITableView, Int) -> OOString? = { _,_ in nil },
        titleForFooter: @escaping (UITableView, Int) -> OOString? = { _,_ in nil },
        canEditRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(false) },
        canMoveRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(false) },
        sectionIndexTitles: @escaping (UITableView) -> [String]? = { _ in nil },
        sectionForSectionIndexTitle: @escaping (UITableView, String, Int) -> OOInt = { _,_,_ in IntConst(0) },
        commit: @escaping (UITableView, UITableViewCellEditingStyle, IndexPath) -> OOExecutable = { _,_,_ in DoNothing() },
        moveRow: @escaping (UITableView, IndexPath, IndexPath) -> OOExecutable = { _,_,_ in DoNothing() }
        ) {
        self.numberOfRows = numberOfRows
        self.cellForRow = cellForRow
        self.numberOfSections = numberOfSections
        self.titleForHeader = titleForHeader
        self.titleForFooter = titleForFooter
        self.canEditRow = canEditRow
        self.canMoveRow = canMoveRow
        self.sectionIndexTitles = sectionIndexTitles
        self.sectionForSectionIndexTitle = sectionForSectionIndexTitle
        self.commit = commit
        self.moveRow = moveRow
    }
    
    
    // MARK: protocol UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows(tableView, section).value
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRow(tableView, indexPath).configuredCell(for: tableView, at: indexPath)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections(tableView).value
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeader(tableView, section)?.value
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return titleForFooter(tableView, section)?.value
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return canEditRow(tableView, indexPath).value
    }
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return canMoveRow(tableView, indexPath).value
    }
    
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexTitles(tableView)
    }
    
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return sectionForSectionIndexTitle(tableView, title, index).value
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        commit(tableView, editingStyle, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveRow(tableView, sourceIndexPath, destinationIndexPath).execute()
    }
    
    // MARK: private
    
    private let numberOfRows: (UITableView, Int) -> OOInt
    private let cellForRow: (UITableView, IndexPath) -> OOTableCell
    private let numberOfSections: (UITableView) -> OOInt
    private let titleForHeader: (UITableView, Int) -> OOString?
    private let titleForFooter: (UITableView, Int) -> OOString?
    private let canEditRow: (UITableView, IndexPath) -> OOBool
    private let canMoveRow: (UITableView, IndexPath) -> OOBool
    private let sectionIndexTitles: (UITableView) -> [String]?
    private let sectionForSectionIndexTitle: (UITableView, String, Int) -> OOInt
    private let commit: (UITableView, UITableViewCellEditingStyle, IndexPath) -> OOExecutable
    private let moveRow: (UITableView, IndexPath, IndexPath) -> OOExecutable
    
}
