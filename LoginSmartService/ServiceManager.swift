//
//  ServiceManager.swift
//  LoginSmartService
//
//  Created by administrator on 4/3/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import Foundation
import Alamofire
import Reachability

class ServiceManager {
    
    typealias MethodHandler1 = (_ sampleParameter : Dictionary<String,Any>)  -> Void
    typealias MethodHandler2 = (_ sampleParameter : String)  -> Void
    typealias MethodHandlerImage = (_ sampleParameter : UIImage)  -> Void
    
    let timeInterval = 30.0
    
    fileprivate func handle(response: DataResponse<Any>, _ correctAnswerHandler: @escaping MethodHandler1, _ incorrectAnswerHandler: @escaping MethodHandler2) {
        
        guard response.result.isSuccess else {
            incorrectAnswerHandler(NSLocalizedString("UnreachableServer", comment: "Unreachable Server"))
            return
        }
        
        guard let json = response.result.value as? [String: Any] else {
            incorrectAnswerHandler(NSLocalizedString("ErrorData", comment: "Error data"))
            return
        }
        
        let statusResponse = (response.response?.statusCode)! as Int
        
        switch statusResponse {
        case 500:
            incorrectAnswerHandler("Status Response \(statusResponse)")
        //                print("working in")
        case 401:
            self.unauthorized()
        case 400:
            var message = "Status Response \(statusResponse)"
            if let errorArray = json[json.keys.first!] as? Array<String> {
                let messageError =  errorArray.reduce("", { $0 + "\n" + $1 })
                message = messageError
            }
            incorrectAnswerHandler(message)
        //                print("bad request")
        case 200:
        
            let data = json as? Dictionary<String,Any>
            correctAnswerHandler(data!)
                  /*  if let data = json["results"] as? Dictionary<String, Any> {
                        correctAnswerHandler(data)
                    } else {
                        correctAnswerHandler(json)
                    }*/
            
        default:
            incorrectAnswerHandler("Status Response \(statusResponse)")
            //                print("Not Status Response 200")
        }
    }
    
    fileprivate func reachability() {
        let snackBar = SnackBar()
        snackBar.build(text: NSLocalizedString("Reachability", comment: "No internet")).show()
    }
    
    fileprivate func unauthorized() {
        
    }
    
    
    
    func requestGet(url:String, correctAnswerHandler: @escaping MethodHandler1, incorrectAnswerHandler: @escaping MethodHandler2) {
        
        let reachability = Reachability()!
        
        if reachability.connection == .none {
            incorrectAnswerHandler("reachability")
            self.reachability()
            return
        }
        
        let urlRequest:URL = URL(string:url)!
        
        var request:URLRequest = URLRequest(url: urlRequest)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = self.timeInterval
        
        
        Alamofire.request(request).responseJSON { response in
            self.handle(response: response, correctAnswerHandler, incorrectAnswerHandler)
        }
        
    }
}
