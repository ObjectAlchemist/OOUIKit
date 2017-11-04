//
//  UITableViewDelegateSelection.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase
import OOFoundation

public final class UITableViewDelegateSelection: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        willSelectRow: @escaping (UITableView, IndexPath) -> OOIndexPath? = { _,indexPath in IndexPathConst(indexPath) },
        didSelectRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        willDeselectRow: @escaping (UITableView, IndexPath) -> OOIndexPath? = { _,_ in nil },
        didDeselectRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() }
        ) {
        self.willSelectRow = willSelectRow
        self.didSelectRow = didSelectRow
        self.willDeselectRow = willDeselectRow
        self.didDeselectRow = didDeselectRow
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return willSelectRow(tableView, indexPath)?.value
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return willDeselectRow(tableView, indexPath)?.value
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        didDeselectRow(tableView, indexPath).execute()
    }
    
    // MARK: - private
    
    private let willSelectRow: (UITableView, IndexPath) -> OOIndexPath?
    private let didSelectRow: (UITableView, IndexPath) -> OOExecutable
    private let willDeselectRow: (UITableView, IndexPath) -> OOIndexPath?
    private let didDeselectRow: (UITableView, IndexPath) -> OOExecutable

}
