//
//  UITableViewDelegateSwipe.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDelegateSwipe: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        leadingSwipeActionsConfiguration: @escaping (UITableView, IndexPath) -> UISwipeActionsConfiguration? = { _,_ in return nil },
        trailingSwipeActionsConfiguration: @escaping (UITableView, IndexPath) -> UISwipeActionsConfiguration? = { _,_ in return nil }
        ) {
        self.leadingSwipeActionsConfiguration = leadingSwipeActionsConfiguration
        self.trailingSwipeActionsConfiguration = trailingSwipeActionsConfiguration
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public final func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return leadingSwipeActionsConfiguration(tableView, indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return trailingSwipeActionsConfiguration(tableView, indexPath)
    }

    // MARK: - private
    
    private let leadingSwipeActionsConfiguration: (UITableView, IndexPath) -> UISwipeActionsConfiguration?
    private let trailingSwipeActionsConfiguration: (UITableView, IndexPath) -> UISwipeActionsConfiguration?
    
}
