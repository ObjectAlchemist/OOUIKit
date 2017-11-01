//
//  ViewCoordinatingResponder.swift
//  OOSwift
//
//  Created by Karsten Litsche on 22.10.17.
//  
//

import UIKit
import OOBase

/**
 This decorator listens for index changes to trigger a becomeFirstResponder to the new index. When index is out of bounds it will resign the current responder.
 e.g. Use it to jump between a sequence of TextFields.
 */
public final class ViewCoordinatingResponder: OOView {
    
    // MARK: - init
    
    public init(index: OOInt, indexChangeListener: OOEventInform, responder: [OOView], content: OOView) {
        self.index = index
        self.indexChangeListener = indexChangeListener
        self.responder = responder
        self.content = content
    }
    
    // MARK: - protocol: OOView
    
    private var _created: Bool = false
    public var ui: UIView {
        if !_created {
            _created = true
            indexChangeListener.set { [weak self] in
                self?.indexHasChanged()
            }
        }
        return content.ui
    }
    
    public func setNeedsRefresh() {
        if _created {
            content.setNeedsRefresh()
        }
    }

    // MARK: - private
    
    private let index: OOInt
    private let indexChangeListener: OOEventInform
    private let responder: [OOView]
    private let content: OOView
    
    private func indexHasChanged() {
        let currentIndex = index.value
        if currentIndex < 0 || currentIndex >= responder.count {
            // index out of bounds means resign current responder if exist
            let currentResponder = responder.first { $0.ui.isFirstResponder }
            guard currentResponder != nil && currentResponder!.ui.resignFirstResponder() else {
                fatalError("Can not resign responder!")
            }
        } else {
            guard responder[currentIndex].ui.becomeFirstResponder() else {
                fatalError("Cant switch responder!")
            }
        }
    }
    
}

/** Convenience initializer. */
public extension ViewCoordinatingResponder {
    
    public convenience init(index: OOWritableInt & OOEventInform, responder: [OOView], content: OOView) {
        self.init(index: index, indexChangeListener: index, responder: responder, content: content)
    }
    
}
