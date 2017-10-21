//
//  ContentContainerViewController.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

final class ContentContainerViewController: UIViewController {
    
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
    
    init(content: OOScreen, willCreate: OOExecutable, didCreate: OOExecutable, willDestroy: OOExecutable) {
        self.content = content
        self.willCreate = willCreate
        self.didCreate = didCreate
        self.willDestroy = willDestroy
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        willDestroy.execute()
    }
    
    override func loadView() {
        willCreate.execute()
        view = ContainerView()
        addContentAsChild()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didCreate.execute()
    }
    
    // MARK: - configuration / api
    
    // MARK: - private
    
    private let content: OOScreen
    private let willCreate: OOExecutable
    private let didCreate: OOExecutable
    private let willDestroy: OOExecutable
    private var containerView: ContainerView {
        return view as! ContainerView
    }
    
    private func addContentAsChild() {
        let contentViewController = content.ui
        addChildViewController(contentViewController)
        containerView.set(childView: contentViewController.view)
        contentViewController.didMove(toParentViewController: self)
    }
    
}
