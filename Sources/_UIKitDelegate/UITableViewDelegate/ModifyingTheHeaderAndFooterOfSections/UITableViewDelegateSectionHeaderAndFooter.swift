//
//  UITableViewDelegateSectionHeaderAndFooter.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDelegateSectionHeaderAndFooter: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        viewForHeader: @escaping (UITableView, Int) -> OOView? = { _,_ in nil },
        viewForFooter: @escaping (UITableView, Int) -> OOView? = { _,_ in nil },
        heightForHeader: @escaping (UITableView, Int) -> OOFloat = { _,_ in FloatConst(UITableView.automaticDimension) },
        estimatedHeightForHeader: @escaping (UITableView, Int) -> OOFloat = { _,_ in FloatConst(UITableView.automaticDimension) },
        heightForFooter: @escaping (UITableView, Int) -> OOFloat = { _,_ in FloatConst(UITableView.automaticDimension) },
        estimatedHeightForFooter: @escaping (UITableView, Int) -> OOFloat = { _,_ in FloatConst(UITableView.automaticDimension) },
        willDisplayHeaderView: @escaping (UITableView, Int) -> OOExecutable = { _,_ in DoNothing() },
        willDisplayFooterView: @escaping (UITableView, Int) -> OOExecutable = { _,_ in DoNothing() }
        ) {
        self.viewForHeader = viewForHeader
        self.viewForFooter = viewForFooter
        self.heightForHeader = heightForHeader
        self.estimatedHeightForHeader = estimatedHeightForHeader
        self.heightForFooter = heightForFooter
        self.estimatedHeightForFooter = estimatedHeightForFooter
        self.willDisplayHeaderView = willDisplayHeaderView
        self.willDisplayFooterView = willDisplayFooterView
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeader(tableView, section)?.ui
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return viewForFooter(tableView, section)?.ui
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(heightForHeader(tableView, section).value)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(estimatedHeightForHeader(tableView, section).value)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(heightForFooter(tableView, section).value)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(estimatedHeightForFooter(tableView, section).value)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        willDisplayHeaderView(tableView, section).execute()
    }
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        willDisplayFooterView(tableView, section).execute()
    }
    
    // MARK: - private
    
    private let viewForHeader: (UITableView, Int) -> OOView?
    private let viewForFooter: (UITableView, Int) -> OOView?
    private let heightForHeader: (UITableView, Int) -> OOFloat
    private let estimatedHeightForHeader: (UITableView, Int) -> OOFloat
    private let heightForFooter: (UITableView, Int) -> OOFloat
    private let estimatedHeightForFooter: (UITableView, Int) -> OOFloat
    private let willDisplayHeaderView: (UITableView, Int) -> OOExecutable
    private let willDisplayFooterView: (UITableView, Int) -> OOExecutable

}
