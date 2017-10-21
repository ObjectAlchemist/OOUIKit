//
//  TableViewDelegatePrinting.swift
//  OOSwift
//
//  Created by Karsten Litsche on 14.10.17.
//
//

import UIKit

/**
 Use this decorator to log print outputs while development/debugging. Define a filterKey if you need a clear identification of this instance.
 For more informations see UIPrintOverload.swift
 */
public final class TableViewDelegatePrinting: NSObject, UITableViewDelegate {
    
    // MARK: - init
    
    convenience override init() {
        fatalError("Not supported!")
    }
    
    public init(_ decorated: UITableViewDelegate, filterKey: String = "") {
        self.decorated = decorated
        self.filterKey = filterKey
    }
    
    // MARK: - protocol: UITableViewDelegate
    
    // Display customization
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        printUI("\(filterKey) table willDisplayCellForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        printUI("\(filterKey) table willDisplayHeaderView \(section) called")
        decorated.tableView?(tableView, willDisplayHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        printUI("\(filterKey) table willDisplayFooterView \(section) called")
        decorated.tableView?(tableView, willDisplayFooterView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        printUI("\(filterKey) table didEndDisplaying (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        printUI("\(filterKey) table didEndDisplayingHeaderView \(section) called")
        decorated.tableView?(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        printUI("\(filterKey) table didEndDisplayingFooterView \(section) called")
        decorated.tableView?(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
    // Variable height support
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        printUI("\(filterKey) table heightForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, heightForRowAt: indexPath) ?? UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        printUI("\(filterKey) table heightForHeaderInSection \(section) called")
        return decorated.tableView?(tableView, heightForHeaderInSection: section) ?? UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        printUI("\(filterKey) table heightForFooterInSection \(section) called")
        return decorated.tableView?(tableView, heightForFooterInSection: section) ?? UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        printUI("\(filterKey) table estimatedHeightForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, estimatedHeightForRowAt: indexPath) ?? UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        printUI("\(filterKey) table estimatedHeightForHeaderInSection \(section) called")
        return decorated.tableView?(tableView, estimatedHeightForHeaderInSection: section) ?? UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        printUI("\(filterKey) table estimatedHeightForFooterInSection \(section) called")
        return decorated.tableView?(tableView, estimatedHeightForFooterInSection: section) ?? UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        printUI("\(filterKey) table viewForHeaderInSection \(section) called")
        return decorated.tableView?(tableView, viewForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        printUI("\(filterKey) table viewForFooterInSection \(section) called")
        return decorated.tableView?(tableView, viewForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        printUI("\(filterKey) table accessoryButtonTappedForRowWith (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, accessoryButtonTappedForRowWith: indexPath)
    }
    
    // Selection
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey) table shouldHighlightRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, shouldHighlightRowAt: indexPath) ?? true
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        printUI("\(filterKey) table didHighlightRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didHighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        printUI("\(filterKey) table didUnhighlightRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didUnhighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        printUI("\(filterKey) table willSelectRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, willSelectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        printUI("\(filterKey) table willDeselectRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, willDeselectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        printUI("\(filterKey) table didSelectRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didSelectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        printUI("\(filterKey) table didDeselectRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, didDeselectRowAt: indexPath)
    }
    
    // Editing
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        printUI("\(filterKey) table editingStyleForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, editingStyleForRowAt: indexPath) ?? .delete
    }
    
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        printUI("\(filterKey) table titleForDeleteConfirmationButtonForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        printUI("\(filterKey) table editActionForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, editActionsForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey) table shouldIndentWhileEditingRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, shouldIndentWhileEditingRowAt: indexPath) ?? true
    }
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        printUI("\(filterKey) table willBeginEditingRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, willBeginEditingRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        printUI("\(filterKey) table didEndEditingRowAt (\(String(describing: indexPath?.section))-\(String(describing: indexPath?.row))) called")
        decorated.tableView?(tableView, didEndEditingRowAt: indexPath)
    }
    
    // Moving/reordering
    
    public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        printUI("\(filterKey) table targetIndexPathForMoveFromRowAt source=(\(sourceIndexPath.section)-\(sourceIndexPath.row)) to=(\(proposedDestinationIndexPath.section)-\(proposedDestinationIndexPath.row)) called")
        return decorated.tableView?(tableView, targetIndexPathForMoveFromRowAt: sourceIndexPath, toProposedIndexPath: proposedDestinationIndexPath) ?? proposedDestinationIndexPath
    }
    
    // Indentation
    
    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        printUI("\(filterKey) table indentationLevelForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, indentationLevelForRowAt: indexPath) ?? 1
    }
    
    // Copy/Paste
    
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey) table shouldShowMenuForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, shouldShowMenuForRowAt: indexPath) ?? false
    }
    
    public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        printUI("\(filterKey) table canPerformActionForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, canPerformAction: action, forRowAt: indexPath, withSender: sender) ?? false
    }
    
    public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        printUI("\(filterKey) table performActionForRowAt (\(indexPath.section)-\(indexPath.row)) called")
        decorated.tableView?(tableView, performAction: action, forRowAt: indexPath, withSender: sender)
    }
    
    // Focus
    
    public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        printUI("\(filterKey) table canFocusRowAt (\(indexPath.section)-\(indexPath.row)) called")
        return decorated.tableView?(tableView, canFocusRowAt: indexPath) ?? false
    }
    
    public func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
        printUI("\(filterKey) table shouldUpdateFocusInContext called")
        return decorated.tableView?(tableView, shouldUpdateFocusIn: context) ?? false
    }
    
    public func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        printUI("\(filterKey) table didUpdateFocusInContext called")
        decorated.tableView?(tableView, didUpdateFocusIn: context, with: coordinator)
    }
    
    public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        printUI("\(filterKey) table indexPathForPreferredFocusedView called")
        return decorated.indexPathForPreferredFocusedView?(in: tableView)
    }
    
    // MARK: - private
    
    private let decorated: UITableViewDelegate
    private let filterKey: String
    
}
