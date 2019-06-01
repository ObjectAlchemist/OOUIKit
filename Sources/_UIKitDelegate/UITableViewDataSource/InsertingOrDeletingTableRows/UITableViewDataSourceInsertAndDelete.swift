//
//  UITableViewDataSourceInsertAndDelete.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDataSourceInsertAndDelete: NSObject, UITableViewDataSource {
    
    // MARK: - init
    
    public init(
        commit: @escaping (UITableView, UITableViewCell.EditingStyle, IndexPath) -> OOExecutable = { _,_,_ in DoNothing() },
        canEditRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(false) }
        ) {
        self.commit = commit
        self.canEditRow = canEditRow
        super.init()
    }
    
    // MARK: - protocol: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("This object do not provide configuration informations!")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("This object do not provide configuration informations!")
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        commit(tableView, editingStyle, indexPath).execute()
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return canEditRow(tableView, indexPath).value
    }
    
    // MARK: - private
    
    private let commit: (UITableView, UITableViewCell.EditingStyle, IndexPath) -> OOExecutable
    private let canEditRow: (UITableView, IndexPath) -> OOBool

}
