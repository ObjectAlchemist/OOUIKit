//
//  ScreenSimple.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/** 
 A base screen executing given actions on flow events.
 Use this inside your OOScrenWrap to create a ui leaf.
 If you need more api than provided you should implement/use another container instead!
 */
public final class ScreenSimple: OOScreen {
    
    // MARK: init
    
    public init(content: OOView, title: OOString = StringConst(""), contentSize: CGSize = CGSize(width: 0, height: 0),
         viewDidLoad: OOExecutable = DoNothing(),
         viewWillAppear: OOExecutable = DoNothing(),
         viewDidAppear: OOExecutable = DoNothing(),
         viewWillDisappear: OOExecutable = DoNothing(),
         viewDidDisappear: OOExecutable = DoNothing()
        ) {
        self.content = content
        self.title = title
        self.contentSize = contentSize
        self.viewDidLoad = viewDidLoad
        self.viewWillAppear = viewWillAppear
        self.viewDidAppear = viewDidAppear
        self.viewWillDisappear = viewWillDisappear
        self.viewDidDisappear = viewDidDisappear
    }
    
    // MARK: protocol OOScreen
    
    public var ui: UIViewController {
        return SimpleViewController(
            content: content,
            headerTitle: title,
            contentSize: contentSize,
            viewDidLoad: viewDidLoad,
            viewWillAppear: viewWillAppear,
            viewDidAppear: viewDidAppear,
            viewWillDisappear: viewWillDisappear,
            viewDidDisappear: viewDidDisappear
        )
    }
    
    // MARK: private
    
    private let content: OOView
    private let title: OOString
    private let contentSize: CGSize
    private let viewDidLoad: OOExecutable
    private let viewWillAppear: OOExecutable
    private let viewDidAppear: OOExecutable
    private let viewWillDisappear: OOExecutable
    private let viewDidDisappear: OOExecutable

}
