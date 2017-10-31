//
//  UITableViewDelegateWrap.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

open /*abstract*/ class UITableViewDelegateWrap: NSObject, UITableViewDelegate {
    
    // MARK: init
    
    public init(origin: UITableViewDelegate) {
        self.origin = origin
    }
    
    // MARK: protocol UITableViewDelegate
    
    // Display customization
    
    public final func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        origin.tableView?(tableView, willDisplayHeaderView: view, forSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        origin.tableView?(tableView, willDisplayFooterView: view, forSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        origin.tableView?(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        origin.tableView?(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
    // Variable height support
    
    public final func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return origin.tableView?(tableView, heightForRowAt: indexPath) ?? UITableViewAutomaticDimension
    }
    
    public final func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return origin.tableView?(tableView, heightForHeaderInSection: section) ?? 0
    }
    
    public final func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return origin.tableView?(tableView, heightForFooterInSection: section) ?? 0
    }
    
    public final func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return origin.tableView?(tableView, estimatedHeightForRowAt: indexPath) ?? UITableViewAutomaticDimension
    }
    
    public final func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return origin.tableView?(tableView, estimatedHeightForHeaderInSection: section) ?? 0
    }
    
    public final func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return origin.tableView?(tableView, estimatedHeightForFooterInSection: section) ?? 0
    }
    
    public final func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return origin.tableView?(tableView, viewForHeaderInSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return origin.tableView?(tableView, viewForFooterInSection: section)
    }
    
    public final func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        origin.tableView?(tableView, accessoryButtonTappedForRowWith: indexPath)
    }
    
    // Selection
    
    public final func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, shouldHighlightRowAt: indexPath) ?? true
    }
    
    public final func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didHighlightRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didUnhighlightRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return origin.tableView?(tableView, willSelectRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return origin.tableView?(tableView, willDeselectRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didSelectRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, didDeselectRowAt: indexPath)
    }
    
    // Editing
    
    public final func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return origin.tableView?(tableView, editingStyleForRowAt: indexPath) ?? .delete
    }
    
    public final func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return origin.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return origin.tableView?(tableView, editActionsForRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, shouldIndentWhileEditingRowAt: indexPath) ?? true
    }
    
    public final func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, willBeginEditingRowAt:indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        origin.tableView?(tableView, didEndEditingRowAt: indexPath)
    }
    
    // Moving/reordering
    
    public final func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return origin.tableView?(tableView, targetIndexPathForMoveFromRowAt: sourceIndexPath, toProposedIndexPath: proposedDestinationIndexPath) ?? proposedDestinationIndexPath
    }
    
    // Indentation
    
    public final func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return origin.tableView?(tableView, indentationLevelForRowAt: indexPath) ?? 1
    }
    
    // Copy/Paste
    
    public final func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, shouldShowMenuForRowAt: indexPath) ?? false
    }
    
    public final func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return origin.tableView?(tableView, canPerformAction: action, forRowAt: indexPath, withSender: sender) ?? false
    }
    
    public final func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        origin.tableView?(tableView, performAction: action, forRowAt: indexPath, withSender: sender)
    }
    
    // Focus
    
    public final func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, canFocusRowAt: indexPath) ?? false
    }
    
    public final func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
        return origin.tableView?(tableView, shouldUpdateFocusIn: context) ?? false
    }
    
    public final func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        origin.tableView?(tableView, didUpdateFocusIn: context, with: coordinator)
    }
    
    public final func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        return origin.indexPathForPreferredFocusedView?(in: tableView)
    }
    
    // MARK: private
    
    private let origin: UITableViewDelegate
    
}
