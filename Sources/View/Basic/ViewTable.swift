//
//  ViewTable.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

/**
 A view displaying a table.
 */
public final class ViewTable: OOView {
    
    // MARK: init
    
    init(reuseIdentifier: [(cellClass: AnyClass, identifier: String)] = [],
         xibReuseIdentifier: [String] = [],
         style: UITableViewStyle = .plain,
         bundle: Bundle = Bundle.main,
         optDataSource: UITableViewDataSource?,
         optDelegate: UITableViewDelegate?) {
        self.dataSource = optDataSource
        self.delegate = optDelegate
        self.reuseIdentifier = reuseIdentifier
        self.xibReuseIdentifier = xibReuseIdentifier
        self.style = style
        self.bundle = bundle
    }
    
    // MARK: protocol OOView
    
    private var _ui: UITableView?
    public var ui: UIView {
        if _ui == nil { _ui = createView() }
        return _ui!
    }
    
    public func setNeedsRefresh() {
        _ui?.reloadData()
    }
    
    // MARK: private
    
    private let dataSource: UITableViewDataSource?
    private let delegate: UITableViewDelegate?
    private let reuseIdentifier: [(cellClass: AnyClass, identifier: String)]
    private let xibReuseIdentifier: [String]
    private let style: UITableViewStyle
    private let bundle: Bundle
    
    private func createView() -> UITableView {
        let view = UITableView(frame: CGRect.zero, style: style)
        if style == .grouped {
            fix35PtBug(view: view)
        }
        reuseIdentifier.forEach { view.register($0.cellClass, forCellReuseIdentifier: $0.identifier) }
        xibReuseIdentifier.forEach { view.register(UINib(nibName: $0, bundle: bundle), forCellReuseIdentifier: $0) }
        view.backgroundColor = UIColor.clear
        view.dataSource = dataSource
        view.delegate = delegate
        return view
    }
    
    private func fix35PtBug(view: UITableView) {
        // see: https://stackoverflow.com/a/18938763/6595536
        view.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.01))
        view.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.01))
    }
    
}

// convenience initializer
public extension ViewTable {
    
    public convenience init(reuseIdentifier: [(cellClass: AnyClass, identifier: String)] = [],
                            xibReuseIdentifier: [String] = [],
                            style: UITableViewStyle = .plain,
                            bundle: Bundle = Bundle.main,
                            dataSource: UITableViewDataSource,
                            delegate: UITableViewDelegate) {
        self.init(reuseIdentifier: reuseIdentifier,
                  xibReuseIdentifier: xibReuseIdentifier,
                  style: style,
                  bundle: bundle,
                  optDataSource: dataSource,
                  optDelegate: delegate)
    }
    
    public convenience init(reuseIdentifier: [(cellClass: AnyClass, identifier: String)] = [],
                            xibReuseIdentifier: [String] = [],
                            style: UITableViewStyle = .plain,
                            bundle: Bundle = Bundle.main,
                            dataSource: UITableViewDataSource) {
        self.init(reuseIdentifier: reuseIdentifier,
                  xibReuseIdentifier: xibReuseIdentifier,
                  style: style,
                  bundle: bundle,
                  optDataSource: dataSource,
                  optDelegate: nil)
    }
    
    public convenience init(reuseIdentifier: [(cellClass: AnyClass, identifier: String)] = [],
                            xibReuseIdentifier: [String] = [],
                            style: UITableViewStyle = .plain,
                            bundle: Bundle = Bundle.main,
                            delegate: UITableViewDelegate) {
        self.init(reuseIdentifier: reuseIdentifier,
                  xibReuseIdentifier: xibReuseIdentifier,
                  style: style,
                  bundle: bundle,
                  optDataSource: nil,
                  optDelegate: delegate)
    }
    
}
