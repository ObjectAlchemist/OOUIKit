//
//  UIPrintOverload.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

/**
 All print decorators of the OOUIKit using this central print function. So it's possible to filter log output with "[UI]" prefix.
 */
func printUI(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    print("[UI] \(items[0])", separator: separator, terminator: terminator)
}
