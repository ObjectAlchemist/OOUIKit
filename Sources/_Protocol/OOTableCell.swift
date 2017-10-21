//
//  OOTableCell.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

// prefix: TableCell
public protocol OOTableCell: class {

    func configuredCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    
}

public final class OOTableCellFake: OOTableCell {

    // MARK: - init
    
    public init() {}
    
    // MARK: - protocol: OOTableCell
    
    public func configuredCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // MARK: - private
    
}

open /*abstract*/ class OOTableCellWrap: OOTableCell {
    
    // MARK: init
    
    public init(origin: OOTableCell) {
        self.origin = origin
    }
    
    // MARK: protocol OOTableCell
    
    public final func configuredCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return origin.configuredCell(for: tableView, at: indexPath)
    }
    
    // MARK: private
    
    private let origin: OOTableCell
    
}
