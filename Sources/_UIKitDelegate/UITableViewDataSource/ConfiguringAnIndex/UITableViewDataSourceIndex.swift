//
//  UITableViewDataSourceIndex.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDataSourceIndex: NSObject, UITableViewDataSource {
    
    // MARK: - init
    
    public init(
        sectionIndexTitles: @escaping (UITableView) -> [String]? = { _ in nil },
        sectionForSectionIndexTitle: @escaping (UITableView, String, Int) -> OOInt = { _,_,_ in IntConst(0) }
        ) {
        self.sectionIndexTitles = sectionIndexTitles
        self.sectionForSectionIndexTitle = sectionForSectionIndexTitle
        super.init()
    }
    
    // MARK: - protocol: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("This object do not provide configuration informations!")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("This object do not provide configuration informations!")
    }
    
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexTitles(tableView)
    }
    
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return sectionForSectionIndexTitle(tableView, title, index).value
    }
    
    // MARK: - private
    
    private let sectionIndexTitles: (UITableView) -> [String]?
    private let sectionForSectionIndexTitle: (UITableView, String, Int) -> OOInt

}
