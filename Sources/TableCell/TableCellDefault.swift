//
//  TableCellDefault.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

public final class TableCellDefault: OOTableCell {
    
    // MARK: - init
    
    public init() {}
    
    // MARK: - protocol: OOTableCell
    
    public func configuredCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    // MARK: - private
    
}
