//
//  ReduceHeightViewController.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

final class ReduceHeightViewController: UIViewController {
    
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
    
    init(content: OOScreen, bottomGap: OOFloat) {
        self.content = content
        self.bottomGap = bottomGap
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = UIView()
        addContentAsChild()
    }
    
    // MARK: - configuration / api
    
    func updateBottomGap() {
        bottomAnchor?.constant = -CGFloat(bottomGap.value)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - private
    
    private let content: OOScreen
    private let bottomGap: OOFloat
    private var bottomAnchor: NSLayoutConstraint?
    
    private func addContentAsChild() {
        let containerView = ContainerView()
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -CGFloat(bottomGap.value))
        bottomAnchor!.isActive = true
        let contentViewController = content.ui
        addChildViewController(contentViewController)
        containerView.set(childView: contentViewController.view)
        contentViewController.didMove(toParentViewController: self)
    }
    
}
