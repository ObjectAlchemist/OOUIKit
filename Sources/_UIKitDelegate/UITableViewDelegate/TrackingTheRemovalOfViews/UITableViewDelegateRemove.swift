//
//  UITableViewDelegateRemove.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDelegateRemove: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        didEndDisplaying: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        didEndDisplayingHeaderView: @escaping (UITableView, Int) -> OOExecutable = { _,_ in DoNothing() },
        didEndDisplayingFooterView: @escaping (UITableView, Int) -> OOExecutable = { _,_ in DoNothing() }
        ) {
        self.didEndDisplaying = didEndDisplaying
        self.didEndDisplayingHeaderView = didEndDisplayingHeaderView
        self.didEndDisplayingFooterView = didEndDisplayingFooterView
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        didEndDisplaying(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        didEndDisplayingHeaderView(tableView, section).execute()
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        didEndDisplayingFooterView(tableView, section).execute()
    }
    
    // MARK: - private
    
    private let didEndDisplaying: (UITableView, IndexPath) -> OOExecutable
    private let didEndDisplayingHeaderView: (UITableView, Int) -> OOExecutable
    private let didEndDisplayingFooterView: (UITableView, Int) -> OOExecutable

}
