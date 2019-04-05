//
//  WOPLoader.swift
//  wop
//
//  Created by Polimentes on 25/05/18.
//  Copyright © 2018 Polimentes Diseno. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class WOPLoader: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet var background: UIView!
    @IBOutlet var loader: NVActivityIndicatorView!
    @IBOutlet var imageLoader: UIImageView!
    
    //MARK: - Local Variables
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("WOPLoader", owner: self, options: nil)
        self.addSubview(contentView)
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.contentView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func removeLoader() {
        self.removeFromSuperview()
    }
    
    func showLoader(in containerView: UIView?, backgroundColor: UIColor = .white, inSuperView: Bool) {
        
        if containerView == nil {
            let gradient: CAGradientLayer = CAGradientLayer()
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            self.frame = window.bounds
            self.background.frame = self.bounds
            gradient.frame = self.background.bounds
            gradient.colors = [UIColor.darkGray.cgColor, UIColor.purple.cgColor]
            gradient.startPoint = CGPoint(x: 0.5, y: 0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1)
            gradient.masksToBounds = true
            self.background.layer.insertSublayer(gradient, at: 0)
            self.background.alpha = 0.95
            self.loader.color = .white
            self.loader.type = .circleStrokeSpin
            self.loader.padding = 0
            self.loader?.startAnimating()
            window.addSubview(self)
        } else {
            self.background.backgroundColor = backgroundColor
            self.imageLoader.removeFromSuperview()
            self.loader.color = UIColor.lightGray
            self.loader.type = .circleStrokeSpin
            self.loader.padding = 0
            self.loader?.startAnimating()
            
            if let superView = containerView?.superview, inSuperView {
                superView.addSubview(self)
            } else {
                containerView?.addSubview(self)
            }
            
            self.translatesAutoresizingMaskIntoConstraints = false
            self.centerXAnchor.constraint(equalTo: (containerView?.centerXAnchor)!).isActive = true
            self.centerYAnchor.constraint(equalTo: (containerView?.centerYAnchor)!).isActive = true
            self.widthAnchor.constraint(equalTo: (containerView?.widthAnchor)!).isActive = true
            self.heightAnchor.constraint(equalTo: (containerView?.heightAnchor)!).isActive = true
        }
    }
    
}
