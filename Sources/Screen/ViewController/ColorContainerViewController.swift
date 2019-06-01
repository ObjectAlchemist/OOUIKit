//
//  ColorContainerViewController.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 Contains another controller (aka content) and defines the background color (statusbar!) of the app.
 */
final class ColorContainerViewController: UIViewController {

    // MARK: - initialization
    
    convenience override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        self.init()
    }
    
    convenience required init(coder aDecoder: NSCoder) {
        self.init()
    }
    
    convenience init() {
        fatalError("Not supported!")
    }
    
    init(color: OOColor, content: OOScreen) {
        self.color = color
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = ContainerView()
        view.backgroundColor = color.value
        addContentAsChild()
    }
    
    // MARK: - configuration / api
    
    // MARK: - private
    
    private let color: OOColor
    private let content: OOScreen
    private var containerView: ContainerView {
        return view as! ContainerView
    }
    
    private func addContentAsChild() {
        let contentViewController = content.ui
        addChild(contentViewController)
        containerView.set(childView: contentViewController.view)
        contentViewController.didMove(toParent: self)
    }

}
