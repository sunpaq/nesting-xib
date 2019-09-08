//
//  NibViewContainer.swift
//  IBDesignableDemo
//
//  Created by 孙御礼 on R 1/09/08.
//  Copyright © Reiwa 1 oreisoft. All rights reserved.
//

import UIKit

@IBDesignable
class NibViewContainer: UIView {

    @IBInspectable var nibName: String = "" {
        didSet {
            self.nibView = loadView()
        }
    }
    
    var nibView: UIView? = nil
    
    private func loadView() -> UIView? {
        return Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?[0] as? UIView
    }
    
    override func layoutSubviews() {
        if let view = nibView {
            addSubview(view)
            view.frame = self.bounds
        }
    }
    
    override func prepareForInterfaceBuilder() {
//        self.nibView = loadView()
//        if let view = nibView {
//            addSubview(view)
//            view.frame = self.bounds
//        }
        //layoutSubviews()
        //nibView?.prepareForInterfaceBuilder()
        
        let label = UILabel()
        label.text = nibName + ".xib"
        label.frame = self.bounds
        label.textAlignment = .center
        addSubview(label)

        layer.borderWidth = 1
        layer.borderColor = CGColor.init(srgbRed: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    }

}
