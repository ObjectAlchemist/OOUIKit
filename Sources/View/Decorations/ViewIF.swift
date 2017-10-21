//
//  ViewIF.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit
import OOBase

/**
 A view decorator for choosing a view depending on a condition.
 */
public final class ViewIF: OOViewWrap {
    
    public init(condition: OOBool, primary: OOView, secondary: OOView) {
        super.init(origin:
            ViewOR(
                condition: condition,
                conditionChangeListener: InformNothing(),
                primary: { primary },
                secondary: { secondary }
            )
        )
    }
    
}
