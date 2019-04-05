//
//  CardView.swift
//  WOP
//
//  Created by Grupo BECM on 01/08/17.
//  Copyright © 2017 POLIMENTES. All rights reserved.
//

import UIKit

//@IBDesignable
class CardView: UIView {
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable public var radiusCorner: CGFloat = 0 {
        didSet {
            self.layoutSubviews()
        }
    }
    
    @IBInspectable public var shadow: Bool = true {
        didSet {
            self.layoutSubviews()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.lightGray {
        didSet {
            self.layoutSubviews()
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 6 {
        didSet {
            self.layoutSubviews()
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 100 {
        didSet {
            self.layoutSubviews()
        }
    }
    
    @IBInspectable public var widthShadowOffset: CGFloat = 0 {
        didSet {
            self.layoutSubviews()
        }
    }
    
    @IBInspectable public var heightShadowOffset: CGFloat = 7 {
        didSet {
            self.layoutSubviews()
        }
    }
    
    @IBInspectable public var capsule: Bool = false {
        didSet {
            self.layoutSubviews()
        }
    }
    
    @IBInspectable public var strokeWidth: CGFloat = 0 {
        didSet {
            self.layoutSubviews()
        }
    }
    
    @IBInspectable var strokeColor: UIColor = UIColor.lightGray {
        didSet {
            self.layoutSubviews()
        }
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = radiusCorner
        self.clipsToBounds = true
        
        if capsule {
            self.contentMode = .scaleAspectFill
            self.layer.cornerRadius = (CGFloat)(self.frame.size.height / 2.0)
            self.clipsToBounds = true
        }
        
        if shadow {
            self.layer.masksToBounds = false
            self.layer.shadowColor = self.shadowColor.cgColor
            self.layer.shadowOpacity = self.shadowOpacity / 100
            self.layer.shadowOffset = CGSize(width: self.widthShadowOffset, height: self.heightShadowOffset)
            self.layer.shadowRadius = self.shadowRadius / 2
        }
        
        if strokeWidth != 0 {
            self.layer.borderWidth = strokeWidth
            self.layer.borderColor = strokeColor.cgColor
        }
    }
}
