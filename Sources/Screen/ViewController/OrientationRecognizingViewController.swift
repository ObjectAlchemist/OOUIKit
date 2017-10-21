//
//  OrientationRecognizingViewController.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 Contains another controller (aka content) and recognize orientation layout by view size. Every time it changes the onChange action will be called with landscape = false OR portrait = true.
 */
final class OrientationRecognizingViewController: UIViewController {

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
    
    init(onChange: @escaping (Bool) -> OOExecutable, content: OOScreen) {
        self.onChange = onChange
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = ContainerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addContentAsChild()
        updateAdapter(for: view.bounds.size)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateAdapter(for: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateAdapter(for: size)
    }
    
    // MARK: - configuration / api
    
    // MARK: - private
    
    private var containerView: ContainerView {
        return view as! ContainerView
    }
    private let onChange: (Bool) -> OOExecutable
    private let content: OOScreen

    private func addContentAsChild() {
        let contentViewController = content.ui
        addChildViewController(contentViewController)
        containerView.set(childView: contentViewController.view)
        contentViewController.didMove(toParentViewController: self)
    }

    private func updateAdapter(for size: CGSize) {
        let isLandscape = size.width > size.height
        onChange(isLandscape).execute()
    }

}
