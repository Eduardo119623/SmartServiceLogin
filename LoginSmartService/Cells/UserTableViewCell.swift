//
//  UserTableViewCell.swift
//  LoginSmartService
//
//  Created by administrator on 4/3/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var naLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    func initCell(user: UserModel, key: Int) {
        self.nameLabel.text = user.name
        self.mailLabel.text = user.email
        self.userNameLabel.text = user.username
        self.directionLabel.text = user.state + ", " + user.city
        self.telLabel.text = user.tel
        
        self.yearsLabel.text = String(user.age)
        self.naLabel.text = user.nat
        self.userImage.layer.cornerRadius = self.userImage.frame.height / 2
        self.userImage.layer.borderColor = UIColor.lightGray.cgColor
        self.userImage.layer.borderWidth = 5
        self.userImage.clipsToBounds = true
        self.userImage.tag = key
        self.userImage.imageFromUrl(user.picture)
    }
    
    
}
