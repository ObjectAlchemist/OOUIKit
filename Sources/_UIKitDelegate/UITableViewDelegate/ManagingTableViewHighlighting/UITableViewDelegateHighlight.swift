//
//  UITableViewDelegateHighlight.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDelegateHighlight: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        shouldHighlightRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(true) },
        didHighlightRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        didUnhighlightRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() }
        ) {
        self.shouldHighlightRow = shouldHighlightRow
        self.didHighlightRow = didHighlightRow
        self.didUnhighlightRow = didUnhighlightRow
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return shouldHighlightRow(tableView, indexPath).value
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        didHighlightRow(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        didUnhighlightRow(tableView, indexPath).execute()
    }
    
    // MARK: - private
    
    private let shouldHighlightRow: (UITableView, IndexPath) -> OOBool
    private let didHighlightRow: (UITableView, IndexPath) -> OOExecutable
    private let didUnhighlightRow: (UITableView, IndexPath) -> OOExecutable

}
