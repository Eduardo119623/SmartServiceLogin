//
//  LoginInteractor.swift
//  LoginSmartService
//
//  Created by administrator on 4/2/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import Foundation
import UIKit

class LoginInteractor: InteractorProtocol {
    var presenter: PresenterProtocol?
    var userDataStore: UserDataStore?
    var userModels: Array<UserModel>!
    func observerError(error: String) {
        
        print(error)
        
    }
    
    func requestUsers(){
       
     UserDataStore().requestUsers(correctAnswer: self.obtainUsers(data:), errorAnswer: self.observerError(error:))
    }
    func obtainUsers(data: Dictionary<String,Any>) {
        self.userModels = Array()
        if let dat = data["results"] as? Array<Dictionary<String, Any>>{
            for value in dat {
                self.userModels.append(UserModel(dic: value))
            }
            
        }
        (self.presenter as! LoginPresenter).getUsers(UsersModels: self.userModels)
      
    }
    
    
}
