//
//  UITableViewDelegateReorder.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOFoundation

public final class UITableViewDelegateReorder: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        targetIndexPathForMove: @escaping (UITableView, IndexPath, IndexPath) -> OOIndexPath = { _,_,proposed in IndexPathConst(proposed) }
        ) {
        self.targetIndexPathForMove = targetIndexPathForMove
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return targetIndexPathForMove(tableView, sourceIndexPath, proposedDestinationIndexPath).value
    }
    
    // MARK: - private
    
    private let targetIndexPathForMove: (UITableView, IndexPath, IndexPath) -> OOIndexPath

}
