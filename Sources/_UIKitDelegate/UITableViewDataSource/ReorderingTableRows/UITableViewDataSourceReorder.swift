//
//  UITableViewDataSourceReorder.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit
import OOBase

public final class UITableViewDataSourceReorder: NSObject, UITableViewDataSource {
    
    // MARK: - init
    
    public init(
        canMoveRow: @escaping (UITableView, IndexPath) -> OOBool = { _,_ in BoolConst(false) },
        moveRow: @escaping (UITableView, IndexPath, IndexPath) -> OOExecutable = { _,_,_ in DoNothing() }
        ) {
        self.canMoveRow = canMoveRow
        self.moveRow = moveRow
        super.init()
    }
    
    // MARK: - protocol: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("This object do not provide configuration informations!")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("This object do not provide configuration informations!")
    }
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return canMoveRow(tableView, indexPath).value
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveRow(tableView, sourceIndexPath, destinationIndexPath).execute()
    }
    
    // MARK: - private
    
    private let canMoveRow: (UITableView, IndexPath) -> OOBool
    private let moveRow: (UITableView, IndexPath, IndexPath) -> OOExecutable

}
