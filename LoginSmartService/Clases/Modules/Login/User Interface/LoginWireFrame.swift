//
//  LoginWireFrame.swift
//  LoginSmartService
//
//  Created by administrator on 4/2/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import Foundation
import UIKit
class LoginWireFrame: WireFrameProtocol {
    
    //MARK: - Protocol Stubs
    var presenter: PresenterProtocol?
    
    var view: ViewProtocol?
    
    var interactor: InteractorProtocol?
    
    enum presentView {
        case Login,User
    }
    init(option: presentView, UsersModels: Array<UserModel> = Array()) {
        self.interactor = LoginInteractor()
        self.presenter = LoginPresenter()
        switch option {
        case .Login:
             self.view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            break
        case .User:
            self.view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
    (   self.view as! UserViewController).usersModels = UsersModels
            break
        }
       
        self.presenter?.interactor = interactor
        self.presenter?.wireframe = self
        self.presenter?.view = view
        self.view?.presenter = presenter
        self.interactor?.presenter = presenter
    }
    
    //MARK: ViewControlls
    func pushViewController(navigationController: UINavigationController?)  {
        navigationController?.pushViewController(self.view as! UIViewController, animated: true)
    }
    
    func goToUserView(UsersModels: Array<UserModel>) {
        //LoginWireFrame(option: .User,UsersModels: UsersModels).pushViewController(navigationController: (self.view as! UIViewController).navigationController)
    }
}
