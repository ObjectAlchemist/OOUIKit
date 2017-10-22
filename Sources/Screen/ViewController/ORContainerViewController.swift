//
//  ORContainerViewController.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

final class ORContainerViewController: UIViewController {

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
    
    init(primaryAvailable: OOBool, primary: @escaping (UIViewController) -> OOScreen, secondary: @escaping (UIViewController) -> OOScreen) {
        self.primaryAvailable = primaryAvailable
        self.primary = primary
        self.secondary = secondary
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
        if lastKnownPrimaryAvailable == nil || primaryAvailable.value != lastKnownPrimaryAvailable {
            lastKnownPrimaryAvailable = primaryAvailable.value
            changeChildViewController()
        }
    }
    
    // MARK: - private
    
    private var containerView: ContainerView {
        return view as! ContainerView
    }
    private let primaryAvailable: OOBool
    private let primary: (UIViewController) -> OOScreen
    private let secondary: (UIViewController) -> OOScreen
    private var lastKnownPrimaryAvailable: Bool!
    private var currentChildScreen: OOScreen! // store it so screens with internal logic are not deinit!

    private func changeChildViewController() {
        childViewControllers.forEach({
            $0.willMove(toParentViewController: nil)
            $0.removeFromParentViewController()
        })
        currentChildScreen = primaryAvailable.value ? primary(self) : secondary(self)
        let childViewController = currentChildScreen.ui
        addChildViewController(childViewController)
        containerView.set(childView: childViewController.view)
        childViewController.didMove(toParentViewController: self)
    }
    
}
