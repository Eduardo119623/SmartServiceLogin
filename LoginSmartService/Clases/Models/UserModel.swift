//
//  UserModel.swift
//  LoginSmartService
//
//  Created by administrator on 4/3/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import Foundation
import UIKit

class UserModel: NSObject {
    
    var gender: String!
    var name: String!
    var title: String!
    var first: String!
    var last: String!
    var city: String!
    var state: String!
    var email: String!
    var username: String!
    var age: String!
    var tel: String!
    var nat: String!
    var picture: String!
    
    init(dic: Dictionary<String, Any>) {
            self.gender = dic["gender"] as? String ?? ""
            if let name = dic["name"] as? Dictionary<String,Any> {
                    self.title = name["name"] as? String ?? ""
                    self.last = name["name"] as? String ?? ""
                    self.first = name["name"] as? String ?? ""
                    self.name = title + " " + first + " " + last
                }
            if let location = dic["location"] as? Dictionary<String,Any> {
                self.city = location["city"] as? String ?? ""
                self.state = location["state"] as? String ?? ""
                
            }
            self.email = dic["email"] as? String ?? ""
            if let login = dic["login"] as? Dictionary<String,Any>{
                self.username = login["username"] as? String ?? ""
            }
            self.tel = dic["phone"] as? String ?? ""
            if let dob = dic["dob"] as? Dictionary<String,Any>{
                self.age = dob["age"] as? String ?? ""
            }
            self.nat = dic["nat"] as? String ?? ""
            if let picture = dic["picture"] as? Dictionary<String,Any>{
                self.picture = picture["medium"] as? String ?? ""
            }
        }
       
        
    
    
    
}
