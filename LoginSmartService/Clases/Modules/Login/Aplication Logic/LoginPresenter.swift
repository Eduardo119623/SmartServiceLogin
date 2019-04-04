//
//  LoginPresenter.swift
//  LoginSmartService
//
//  Created by administrator on 4/2/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import Foundation
import UIKit
class LoginPresenter: PresenterProtocol {
    var view: ViewProtocol?
    
    var wireframe: WireFrameProtocol?
    
    var interactor: InteractorProtocol?
    
    func observerError(error: String) {
        
    }
    
    func showMessage(message: String) {
        
    }
    
    func requesUsers() {
        (self.interactor as! LoginInteractor).requestUsers()
    }
    func getUsers(
        UsersModels: Array<UserModel>) {
        
        (self.wireframe as! LoginWireFrame).goToUserView(UsersModels: UsersModels)
         (self.view as! SmartViewController).removeLoader()
    }
    
}
