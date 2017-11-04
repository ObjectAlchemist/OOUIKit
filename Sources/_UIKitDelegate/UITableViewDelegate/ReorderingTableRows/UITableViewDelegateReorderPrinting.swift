//
//  UITableViewDelegateReorderPrinting.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public final class UITableViewDelegateReorderPrinting: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(_ decorated: UITableViewDelegate, filterKey: String = "") {
        self.decorated = decorated
        // add space if exist to separate following log
        self.filterKey = filterKey.count == 0 ? "" : "\(filterKey) "
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        printUI("\(filterKey)table targetIndexPathForMoveFromRowAt source=(\(sourceIndexPath.section)-\(sourceIndexPath.row)) to=(\(proposedDestinationIndexPath.section)-\(proposedDestinationIndexPath.row)) called")
        return decorated.tableView?(tableView, targetIndexPathForMoveFromRowAt: sourceIndexPath, toProposedIndexPath: proposedDestinationIndexPath) ?? proposedDestinationIndexPath
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
