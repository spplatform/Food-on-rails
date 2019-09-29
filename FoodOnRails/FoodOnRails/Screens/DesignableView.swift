//
//  DesignableView.swift
//  JustSu
//
//  Created by Andrey Korobkin on 12.07.16.
//  Copyright © 2016 dataart. All rights reserved.
//

import UIKit

//@IBDesignable
class DesignableView: UIView {
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            super.frame = newValue
            if self.circular {
                self.cornerRadius = self.frame.height / 2
            }
        }
    }
    
    @IBInspectable
    var circular: Bool = false {
        didSet {
            self.cornerRadius = self.frame.height / 2
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let color = self.layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            guard let color = self.layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowXOffset: CGFloat {
        get {
            return self.layer.shadowOffset.width
        }
        set {
            var offset = self.layer.shadowOffset
            offset.width = newValue
            self.layer.shadowOffset = offset
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
}
