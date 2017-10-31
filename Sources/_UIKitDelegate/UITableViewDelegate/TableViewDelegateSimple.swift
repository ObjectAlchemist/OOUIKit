//
//  TableViewDelegateSimple.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase
import OOFoundation

public final class TableViewDelegateSimple: NSObject, UITableViewDelegate {
    
    // MARK: init
    
    convenience override init() {
        fatalError("Not supported!")
    }

    public init(
        willDisplay: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        willDisplayHeaderView: @escaping (UITableView, Int) -> OOExecutable = { _,_ in DoNothing() },
        willDisplayFooterView: @escaping (UITableView, Int) -> OOExecutable = { _,_ in DoNothing() },
        didEndDisplaying: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        didEndDisplayingHeaderView: @escaping (UITableView, Int) -> OOExecutable = { _,_ in DoNothing() },
        didEndDisplayingFooterView: @escaping (UITableView, Int) -> OOExecutable = { _,_ in DoNothing() },
        heightForRow: @escaping (UITableView, IndexPath) -> OOFloat = { _,_ in FloatConst(UITableViewAutomaticDimension) },
        heightForHeader: @escaping (UITableView, Int) -> OOFloat = { _,_ in FloatConst(UITableViewAutomaticDimension) },
        heightForFooter: @escaping (UITableView, Int) -> OOFloat = { _,_ in FloatConst(UITableViewAutomaticDimension) },
        estimatedHeightForRow: @escaping (UITableView, IndexPath) -> OOFloat = { _,_ in FloatConst(UITableViewAutomaticDimension) },
        estimatedHeightForHeader: @escaping (UITableView, Int) -> OOFloat = { _,_ in FloatConst(UITableViewAutomaticDimension) },
        estimatedHeightForFooter: @escaping (UITableView, Int) -> OOFloat = { _,_ in FloatConst(UITableViewAutomaticDimension) },
        viewForHeader: @escaping (UITableView, Int) -> OOView? = { _,_ in nil },
        viewForFooter: @escaping (UITableView, Int) -> OOView? = { _,_ in nil },
        accessoryButtonTapped: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in return DoNothing() },
        shouldHighlightRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(true) },
        didHighlightRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        didUnhighlightRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        willSelectRow: @escaping (UITableView, IndexPath) -> OOIndexPath? = { _,indexPath in IndexPathConst(indexPath) },
        willDeselectRow: @escaping (UITableView, IndexPath) -> OOIndexPath? = { _,_ in nil },
        didSelectRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        didDeselectRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        editingStyleForRow: @escaping (UITableView, IndexPath) -> UITableViewCellEditingStyle = { _,_ in .delete },
        titleForDeleteConfirmationButtonForRow: @escaping (UITableView, IndexPath) -> OOString? = { _,_ in nil },
        editActionsForRow: @escaping (UITableView, IndexPath) -> [UITableViewRowAction]? = { _,_ in nil },
        shouldIndentWhileEditingRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(true) },
        willBeginEditingRow: @escaping (UITableView, IndexPath) -> OOExecutable = { _,_ in DoNothing() },
        didEndEditingRow: @escaping (UITableView, IndexPath?) -> OOExecutable = { _,_ in DoNothing() },
        targetIndexPathForMove: @escaping (UITableView, IndexPath, IndexPath) -> OOIndexPath = { _,_,proposed in IndexPathConst(proposed) },
        indentationLevelForRow: @escaping (UITableView, IndexPath) -> OOInt = { _,_ in IntConst(1) },
        shouldShowMenuForRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(false) },
        canPerformAction: @escaping (UITableView, Selector, IndexPath, Any?) -> OOBool = { _,_,_,_ in BoolConst(false) },
        performAction: @escaping (UITableView, Selector, IndexPath, Any?) -> OOExecutable = { _,_,_,_ in DoNothing() },
        canFocusRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(false) },
        shouldUpdateFocus: @escaping (UITableView, UITableViewFocusUpdateContext) -> OOBool = { _,_ in BoolConst(false) },
        didUpdateFocus: @escaping (UITableView, UITableViewFocusUpdateContext, UIFocusAnimationCoordinator) -> OOExecutable = { _,_,_ in DoNothing() },
        indexPathForPreferredFocusedView: @escaping (UITableView) -> OOIndexPath? = { _ in nil }
        ) {
        self.willDisplay = willDisplay
        self.willDisplayHeaderView = willDisplayHeaderView
        self.willDisplayFooterView = willDisplayFooterView
        self.didEndDisplaying = didEndDisplaying
        self.didEndDisplayingHeaderView = didEndDisplayingHeaderView
        self.didEndDisplayingFooterView = didEndDisplayingFooterView
        self.heightForRow = heightForRow
        self.heightForHeader = heightForHeader
        self.heightForFooter = heightForFooter
        self.estimatedHeightForRow = estimatedHeightForRow
        self.estimatedHeightForHeader = estimatedHeightForHeader
        self.estimatedHeightForFooter = estimatedHeightForFooter
        self.viewForHeader = viewForHeader
        self.viewForFooter = viewForFooter
        self.accessoryButtonTapped = accessoryButtonTapped
        self.shouldHighlightRow = shouldHighlightRow
        self.didHighlightRow = didHighlightRow
        self.didUnhighlightRow = didUnhighlightRow
        self.willSelectRow = willSelectRow
        self.willDeselectRow = willDeselectRow
        self.didSelectRow = didSelectRow
        self.didDeselectRow = didDeselectRow
        self.editingStyleForRow = editingStyleForRow
        self.titleForDeleteConfirmationButtonForRow = titleForDeleteConfirmationButtonForRow
        self.editActionsForRow = editActionsForRow
        self.shouldIndentWhileEditingRow = shouldIndentWhileEditingRow
        self.willBeginEditingRow = willBeginEditingRow
        self.didEndEditingRow = didEndEditingRow
        self.targetIndexPathForMove = targetIndexPathForMove
        self.indentationLevelForRow = indentationLevelForRow
        self.shouldShowMenuForRow = shouldShowMenuForRow
        self.canPerformAction = canPerformAction
        self.performAction = performAction
        self.canFocusRow = canFocusRow
        self.shouldUpdateFocus = shouldUpdateFocus
        self.didUpdateFocus = didUpdateFocus
        self.indexPathForPreferredFocusedView = indexPathForPreferredFocusedView
        super.init()
    }
    
    // MARK: protocol UITableViewDelegate
    
    // Display customization
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        willDisplay(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        willDisplayHeaderView(tableView, section).execute()
    }
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        willDisplayFooterView(tableView, section).execute()
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        didEndDisplaying(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        didEndDisplayingHeaderView(tableView, section).execute()
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        didEndDisplayingFooterView(tableView, section).execute()
    }
    
    // Variable height support
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightForRow(tableView, indexPath).value)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(heightForHeader(tableView, section).value)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(heightForFooter(tableView, section).value)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(estimatedHeightForRow(tableView, indexPath).value)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(estimatedHeightForHeader(tableView, section).value)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(estimatedHeightForFooter(tableView, section).value)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeader(tableView, section)?.ui
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return viewForFooter(tableView, section)?.ui
    }
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        accessoryButtonTapped(tableView, indexPath).execute()
    }

    // Selection

    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return shouldHighlightRow(tableView, indexPath).value
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        didHighlightRow(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        didUnhighlightRow(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return willSelectRow(tableView, indexPath)?.value
    }
    
    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return willDeselectRow(tableView, indexPath)?.value
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        didDeselectRow(tableView, indexPath).execute()
    }
    
    // Editing
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return editingStyleForRow(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return titleForDeleteConfirmationButtonForRow(tableView, indexPath)?.value
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return editActionsForRow(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return shouldIndentWhileEditingRow(tableView, indexPath).value
    }
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        willBeginEditingRow(tableView, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        didEndEditingRow(tableView, indexPath).execute()
    }
    
    // Moving/reordering
    
    public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return targetIndexPathForMove(tableView, sourceIndexPath, proposedDestinationIndexPath).value
    }
    
    // Indentation

    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indentationLevelForRow(tableView, indexPath).value
    }
    
    // Copy/Paste
    
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return shouldShowMenuForRow(tableView, indexPath).value
    }
    
    public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return canPerformAction(tableView, action, indexPath, sender).value
    }
    
    public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        performAction(tableView, action, indexPath, sender).execute()
    }
    
    // Focus
    
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
    
    // MARK: private
    
    private let willDisplay: (UITableView, IndexPath) -> OOExecutable
    private let willDisplayHeaderView: (UITableView, Int) -> OOExecutable
    private let willDisplayFooterView: (UITableView, Int) -> OOExecutable
    private let didEndDisplaying: (UITableView, IndexPath) -> OOExecutable
    private let didEndDisplayingHeaderView: (UITableView, Int) -> OOExecutable
    private let didEndDisplayingFooterView: (UITableView, Int) -> OOExecutable
    private let heightForRow: (UITableView, IndexPath) -> OOFloat
    private let heightForHeader: (UITableView, Int) -> OOFloat
    private let heightForFooter: (UITableView, Int) -> OOFloat
    private let estimatedHeightForRow: (UITableView, IndexPath) -> OOFloat
    private let estimatedHeightForHeader: (UITableView, Int) -> OOFloat
    private let estimatedHeightForFooter: (UITableView, Int) -> OOFloat
    private let viewForHeader: (UITableView, Int) -> OOView?
    private let viewForFooter: (UITableView, Int) -> OOView?
    private let accessoryButtonTapped: (UITableView, IndexPath) -> OOExecutable
    private let shouldHighlightRow: (UITableView, IndexPath) -> OOBool
    private let didHighlightRow: (UITableView, IndexPath) -> OOExecutable
    private let didUnhighlightRow: (UITableView, IndexPath) -> OOExecutable
    private let willSelectRow: (UITableView, IndexPath) -> OOIndexPath?
    private let willDeselectRow: (UITableView, IndexPath) -> OOIndexPath?
    private let didSelectRow: (UITableView, IndexPath) -> OOExecutable
    private let didDeselectRow: (UITableView, IndexPath) -> OOExecutable
    private let editingStyleForRow: (UITableView, IndexPath) -> UITableViewCellEditingStyle
    private let titleForDeleteConfirmationButtonForRow: (UITableView, IndexPath) -> OOString?
    private let editActionsForRow: (UITableView, IndexPath) -> [UITableViewRowAction]?
    private let shouldIndentWhileEditingRow: (UITableView, IndexPath) -> OOBool
    private let willBeginEditingRow: (UITableView, IndexPath) -> OOExecutable
    private let didEndEditingRow: (UITableView, IndexPath?) -> OOExecutable
    private let targetIndexPathForMove: (UITableView, IndexPath, IndexPath) -> OOIndexPath
    private let indentationLevelForRow: (UITableView, IndexPath) -> OOInt
    private let shouldShowMenuForRow: (UITableView, IndexPath) -> OOBool
    private let canPerformAction: (UITableView, Selector, IndexPath, Any?) -> OOBool
    private let performAction: (UITableView, Selector, IndexPath, Any?) -> OOExecutable
    private let canFocusRow: (UITableView, IndexPath) -> OOBool
    private let shouldUpdateFocus: (UITableView, UITableViewFocusUpdateContext) -> OOBool
    private let didUpdateFocus: (UITableView, UITableViewFocusUpdateContext, UIFocusAnimationCoordinator) -> OOExecutable
    private let indexPathForPreferredFocusedView: (UITableView) -> OOIndexPath?
    
}
