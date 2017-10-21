//
//  SwitchContainerViewController.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

final class SwitchContainerViewController: UIViewController {
    
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
    
    init(screenId: OOInt, screens: [(UIViewController) -> OOScreen]) {
        guard screens.count >= 2 else { fatalError("A screen switch with less than 2 screen constructors makes no sense!") }
        self.screenId = screenId
        self.screens = screens
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = ContainerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    // MARK: - configuration / api
    
    func update() {
        if lastKnownScreenId == nil || screenId.value != lastKnownScreenId {
            lastKnownScreenId = screenId.value
            changeChildViewController()
        }
    }
    
    // MARK: - private
    
    private var containerView: ContainerView {
        return view as! ContainerView
    }
    private let screenId: OOInt
    private let screens: [(UIViewController) -> OOScreen]
    private var lastKnownScreenId: Int!
    
    private func changeChildViewController() {
        childViewControllers.forEach({
            $0.willMove(toParentViewController: nil)
            $0.removeFromParentViewController()
        })
        let childViewController = screens[lastKnownScreenId](self).ui
        addChildViewController(childViewController)
        containerView.set(childView: childViewController.view)
        childViewController.didMove(toParentViewController: self)
    }
    
}
