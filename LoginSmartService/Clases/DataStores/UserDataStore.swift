//
//  UserDataStore.swift
//  LoginSmartService
//
//  Created by administrator on 4/3/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import Foundation
class UserDataStore {
    
    //    var datastore: CoreDataController?
    lazy var serviceManager = { ServiceManager() }()
    
    typealias CorrectHandler = (_ data : Dictionary<String,Any>)  -> Void
    typealias ErrorHandler = (_ msg : String)  -> Void
    
    var errorHandler: ErrorHandler!
    var correctHandler: CorrectHandler!
    
    
    static let OWN = "ownself"
    static let FOLLOWED = "followed"
    
    //Delete Current User
    func deleteCurrentUser() {
        
    }
    
    
    
    //UserRequest
    func requestUsers(correctAnswer:@escaping CorrectHandler, errorAnswer:@escaping ErrorHandler) {
        let path = Bundle.main.url(forResource: "Services", withExtension: "plist")
        let dic = NSDictionary(contentsOf: path!) as? [String: Any]
        let service = dic?["smartService"] as! String
        let webService = service
        
        self.errorHandler = errorAnswer
        self.correctHandler = correctAnswer
        
        self.serviceManager.requestGet(url: webService, correctAnswerHandler: correctAnswer, incorrectAnswerHandler: errorAnswer)
    }
}
