//
//  SimpleViewController.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

final class SimpleViewController: UIViewController {
    
    // MARK: init
    
    convenience override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        self.init()
    }
    
    convenience required init(coder aDecoder: NSCoder) {
        self.init()
    }
    
    convenience init() {
        fatalError("Not supported!")
    }
    
    init(content: OOView, headerTitle: OOString, contentSize: CGSize,
         viewDidLoad: OOExecutable = DoNothing(),
         viewWillAppear: OOExecutable = DoNothing(),
         viewDidAppear: OOExecutable = DoNothing(),
         viewWillDisappear: OOExecutable = DoNothing(),
         viewDidDisappear: OOExecutable = DoNothing()
        ) {
        self.content = content
        self.headerTitle = headerTitle
        self.contentSize = contentSize
        self.actionViewDidLoad = viewDidLoad
        self.actionViewWillAppear = viewWillAppear
        self.actionViewDidAppear = viewDidAppear
        self.actionViewWillDisappear = viewWillDisappear
        self.actionViewDidDisappear = viewDidDisappear
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = content.ui
        title = headerTitle.value
        preferredContentSize = contentSize
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionViewDidLoad.execute()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        actionViewWillAppear.execute()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        actionViewDidAppear.execute()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        actionViewWillDisappear.execute()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        actionViewDidDisappear.execute()
    }
    
    // MARK: private
    
    private let content: OOView
    private let headerTitle: OOString
    private let contentSize: CGSize
    private let actionViewDidLoad: OOExecutable
    private let actionViewWillAppear: OOExecutable
    private let actionViewDidAppear: OOExecutable
    private let actionViewWillDisappear: OOExecutable
    private let actionViewDidDisappear: OOExecutable
    
}
