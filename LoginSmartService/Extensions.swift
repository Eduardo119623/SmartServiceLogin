//
//  Extensions.swift
//  LoginSmartService
//
//  Created by administrator on 4/2/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import Foundation
import  UIKit
import SDWebImage
//MARK: - STRING
extension String {
    
    func validateEmailFormat() -> Bool {
        var tempSring = self
        if tempSring.last == " " {
            tempSring.removeLast()
        }
        if tempSring.replacingOccurrences(of: " ", with: "").isEmpty {
            return false
        }
        let emailRegEx1 = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,}"
        let emailRegEx2 = "[A-Z0-9a-z._]+@[A-Za-z0-9]+\\.[A-Za-z]{2,4}+\\.[A-Za-z]{2,4}"
        let emailTest1 = NSPredicate(format:"SELF MATCHES %@", emailRegEx1)
        let emailTest2 = NSPredicate(format:"SELF MATCHES %@", emailRegEx2)
        if (emailTest1.evaluate(with: tempSring) || emailTest2.evaluate(with: tempSring)) {
            return true
        } else {
            return false
        }
    }
    
    func validatePasswordFormat() -> Bool {
        if self.contains(" ") {
            return false
        }
        let pwdRegEx = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{1,}$"
        let pwdTest = NSPredicate(format:"SELF MATCHES %@", pwdRegEx)
        if (pwdTest.evaluate(with: self) && self.count > 6) {
            return true
        } else {
            return false
        }
    }
    func validateUserNameFormat() -> Bool {
        var tempSring = self
        if tempSring.last == " " {
            tempSring.removeLast()
        }
        if tempSring.replacingOccurrences(of: " ", with: "").isEmpty {
            return false
        }
        let userNameRegEx = "^[A-Za-z0-9-ZáÁéÉíÍóÓúÚ\\-_]*$"
        let userNameTest = NSPredicate(format:"SELF MATCHES %@", userNameRegEx)
        if (userNameTest.evaluate(with: self) && self.count >= Constants.USERNAME_MINLENGTH && self.count <= Constants.USERNAME_MAXLENGTH) {
            return true
        } else {
            return false
        }
    }
    
}
//MARK: - UIIMAGEVIEW
extension UIImageView {
    func imageFromUrl(_ urlString: String?, force: Bool = false, placeholder: UIImage? = nil, key: Int = 0, completion: (() -> ())? = nil) {
        self.tag = key
        self.image = placeholder ?? #imageLiteral(resourceName: "userImagePlaceholder")
        
        guard let urlStringRemplace = urlString?.replacingOccurrences(of: " ", with: ""), let urlRemplace = URL(string: urlStringRemplace) else {
            return
        }
        
        if force {
            SDImageCache.shared.removeImage(forKey: urlStringRemplace, fromDisk: true)
        }
        
        sd_setImage(with: urlRemplace, placeholderImage: placeholder ?? #imageLiteral(resourceName: "userImagePlaceholder")) { (image, error, type, url) in
            completion?()
        }
        
        
    }
}
extension UILabel {
    class func calculateOptimalHeight(width: CGFloat, text: String, font: UIFont = UIFont.systemFont(ofSize: 12)) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
}

