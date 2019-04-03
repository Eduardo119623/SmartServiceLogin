//
//  Interfaces.swift
//  LoginSmartService
//
//  Created by administrator on 4/2/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
//    PROTOCOLO PARA VISTAS EN GENERAL

protocol ViewProtocol {
    var presenter: PresenterProtocol? {get set}
}

protocol PresenterProtocol {
    var view: ViewProtocol? {get set}
    var wireframe: WireFrameProtocol? {get set}
    var interactor: InteractorProtocol? {get set}
    func observerError(error:String)
    func showMessage(message: String)
}

protocol InteractorProtocol {
    var presenter: PresenterProtocol? {get set}
    func observerError(error:String)
   
}

protocol WireFrameProtocol {
    var presenter: PresenterProtocol? {get set}
    var view: ViewProtocol? {get set}
    var interactor: InteractorProtocol? {get set}
}
