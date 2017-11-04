//
//  UITableViewDelegateConfiguration.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDelegateConfiguration: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    public init(
        heightForRow: @escaping (UITableView, IndexPath) -> OOFloat = { _,_ in FloatConst(UITableViewAutomaticDimension) },
        estimatedHeightForRow: @escaping (UITableView, IndexPath) -> OOFloat = { _,_ in FloatConst(UITableViewAutomaticDimension) },
        indentationLevelForRow: @escaping (UITableView, IndexPath) -> OOInt = { _,_ in IntConst(1) },
        willDisplay: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        shouldSpringLoad: @escaping (UITableView, IndexPath, UISpringLoadedInteractionContext) -> OOBool = { _,_,_ in BoolConst(true) }
        ) {
        self.heightForRow = heightForRow
        self.estimatedHeightForRow = estimatedHeightForRow
        self.indentationLevelForRow = indentationLevelForRow
        self.willDisplay = willDisplay
        self.shouldSpringLoad = shouldSpringLoad
        super.init()
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightForRow(tableView, indexPath).value)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(estimatedHeightForRow(tableView, indexPath).value)
    }
    
    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indentationLevelForRow(tableView, indexPath).value
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        willDisplay(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        return shouldSpringLoad(tableView, indexPath, context).value
    }
    
    // MARK: - private
    
    private let heightForRow: (UITableView, IndexPath) -> OOFloat
    private let estimatedHeightForRow: (UITableView, IndexPath) -> OOFloat
    private let indentationLevelForRow: (UITableView, IndexPath) -> OOInt
    private let willDisplay: (UITableView, IndexPath) -> OOExecutable
    private let shouldSpringLoad: (UITableView, IndexPath, UISpringLoadedInteractionContext) -> OOBool

}
