//
//  NibView.swift
//  IBDesignableDemo
//
//  Created by 孙御礼 on R 1/09/08.
//  Copyright © Reiwa 1 oreisoft. All rights reserved.
//

import UIKit

@IBDesignable
class NibView: UIView {

    //MARK: - Interface Builder Debug
    @IBInspectable var doesDrawPreview: Bool = false

    @IBInspectable var debugColor: UIColor = UIColor.clear

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        if doesDrawPreview {
            inflateNib()
        } else {
            removeNib()
            showNibName()
            showBorder()
            backgroundColor = debugColor
        }
    }
    
    //MARK: - Class implementation
    private var nibView: UIView? = nil
    
    func inflateNib() {
        if nibView == nil {
            nibView = self.fillWithNib()
        }
    }
    
    func removeNib() {
        nibView?.removeFromSuperview()
        nibView = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        inflateNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        inflateNib()
    }
    
}

extension UIView {
    
    func className() -> String {
        let thisType = type(of: self)
        return String(describing: thisType)
    }
    
    func fillWithNib(nibName: String) -> UIView? {
        let bundle = Bundle.init(for: type(of: self))
        if let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
            return view
        }
        return nil
    }
    
    func fillWithNib() -> UIView? {
        return fillWithNib(nibName: className())
    }
    
    func showBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
    }
    
    func showNibName() {
        let label = UILabel()
        label.text = className() + ".xib"
        label.frame = self.bounds
        label.textAlignment = .center
        addSubview(label)
    }
}
