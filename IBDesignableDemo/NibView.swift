//
//  NibView.swift
//  IBDesignableDemo
//
//  Created by 孙御礼 on R 1/09/08.
//  Copyright © Reiwa 1 oreisoft. All rights reserved.
//

import UIKit

class NibView: UIView {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override class func prepareForInterfaceBuilder() {

    }
    
    override func prepareForInterfaceBuilder() {
        self.label.text = "prepared for IB"
        self.button.titleLabel?.text = "prepared"
    }
}
