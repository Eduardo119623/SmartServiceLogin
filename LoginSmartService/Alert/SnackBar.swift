//
//  SnackBar.swift
//  wop
//
//  Created by Polimentes on 18/05/18.
//  Copyright © 2018 Polimentes Diseno. All rights reserved.
//

import UIKit

class SnackBar: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet var backgroundView: CardView!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var actionButton: UIButton!
    @IBOutlet var contentView: UIView!
    
    
    
    //MARK: - IBAction
    @IBAction func buttonAction(_ sender: UIButton) {
        self.action()
    }
    
    //MARK: - Local Variables
    var action: (() -> Void) = {}
    
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
        Bundle.main.loadNibNamed("SnackBar", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
    }
    
    func build(text: String, action: ((() -> Void), String)? = nil) -> SnackBar {

        let heightCalulate = UILabel.calculateOptimalHeight(width: self.textLabel.frame.width, text: text,font: self.textLabel.font)
        self.textLabel.text = text
        
        self.textLabel.frame = CGRect(x: self.textLabel.frame.origin.x, y: self.textLabel.frame.origin.y, width: self.textLabel.frame.width, height: heightCalulate)
        self.updateConstraints()
        
        if let actionClosure = action {
            self.actionButton.setTitle(actionClosure.1, for: .normal)
            self.action = actionClosure.0
        } else {
            self.actionButton.removeFromSuperview()
        }
        
        guard let window = UIApplication.shared.keyWindow else {
            self.frame = CGRect.zero
            return self
        }
        
        let width = window.frame.width
        let height = window.frame.height
        let snackBarHeight = heightCalulate + 64
        
        self.frame = CGRect(x:0, y: height - snackBarHeight, width: width, height: snackBarHeight)
        
        return self
        
    }
    
    func show() {
        DispatchQueue.main.async {
            self.tag = 2441
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            let height = window.frame.height
            
            if window.viewWithTag(self.tag) == nil {
                window.addSubview(self)
                self.transform = self.transform.translatedBy(x: 0, y: height + self.frame.height)
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                    self.transform = CGAffineTransform.identity
                }, completion: { fininshed in
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                        UIView.animate(withDuration: 2, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                            self.transform = CGAffineTransform.identity.translatedBy(x: 0, y: height + self.frame.height)
                        }, completion: { finished in
                            self.removeFromSuperview()
                        })
                    })
                })
            }
        }
    }
}
