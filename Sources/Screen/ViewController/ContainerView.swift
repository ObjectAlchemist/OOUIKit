//
//  ContainerView.swift
//  OOSwift
//
//  Created by Karsten Litsche on 01.09.17.
//
//

import UIKit

class ContainerView: UIView {
    
    // MARK: init
    
    // MARK: api
    
    final func set(childView: UIView) {
        subviews.forEach({
            $0.removeConstraints($0.constraints)
            $0.removeFromSuperview()
        })
        addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        childView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        childView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        childView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        childView.setNeedsUpdateConstraints()
        childView.setNeedsLayout()
    }
    
    // MARK: private
    
}
