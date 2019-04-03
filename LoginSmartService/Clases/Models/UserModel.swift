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
    
    init(data: Dictionary<String, Any>) {
        if let dat = data["results"] as? Array<Dictionary<String, Any>>, let dic = dat.first {
                self.gender = dic["gender"] as? String ?? ""
                if let name = dic["name"] as? Dictionary<String,String> {
                    self.name = ""
                    self.title = ""
                    self.last = ""
                    self.first = ""
                    for (key,value) in name {
                        if key == "title" {
                            title = value
                        }
                        if key == "first" {
                            first = value
                        }
                        if key == "last" {
                            last = value
                        }
                        self.name = title + " " + first + " " + last
                    }
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
    
    
}
