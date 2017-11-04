//
//  UITableViewDelegateFocus.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase
import OOFoundation

public final class UITableViewDelegateFocus: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        canFocusRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(false) },
        shouldUpdateFocus: @escaping (UITableView, UITableViewFocusUpdateContext) -> OOBool = { _,_ in BoolConst(false) },
        didUpdateFocus: @escaping (UITableView, UITableViewFocusUpdateContext, UIFocusAnimationCoordinator) -> OOExecutable = { _,_,_ in DoNothing() },
        indexPathForPreferredFocusedView: @escaping (UITableView) -> OOIndexPath? = { _ in nil }
        ) {
        self.canFocusRow = canFocusRow
        self.shouldUpdateFocus = shouldUpdateFocus
        self.didUpdateFocus = didUpdateFocus
        self.indexPathForPreferredFocusedView = indexPathForPreferredFocusedView
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return canFocusRow(tableView, indexPath).value
    }
    
    public func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
        return shouldUpdateFocus(tableView, context).value
    }
    
    public func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        didUpdateFocus(tableView, context, coordinator).execute()
    }
    
    public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        return indexPathForPreferredFocusedView(tableView)?.value
    }
    
    // MARK: - private
    
    private let canFocusRow: (UITableView, IndexPath) -> OOBool
    private let shouldUpdateFocus: (UITableView, UITableViewFocusUpdateContext) -> OOBool
    private let didUpdateFocus: (UITableView, UITableViewFocusUpdateContext, UIFocusAnimationCoordinator) -> OOExecutable
    private let indexPathForPreferredFocusedView: (UITableView) -> OOIndexPath?

}
