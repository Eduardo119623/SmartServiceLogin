//
//  ViewController.swift
//  LoginSmartService
//
//  Created by Esfera Estudio S de RL de CV on 4/2/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import UIKit

class LoginViewController: SmartViewController, ViewProtocol {
    //MARK: - Protocol Stubs
    var presenter: PresenterProtocol?
    
     //MARK: - Local Variables
    

     // MARK: - IBOutlets
    
    
    // ACTION: - IBOutles
    
    @IBAction func logiinAction(_ sender: UIButton) {
        (self.presenter as! LoginPresenter).requesUsers()
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initModule()
        self.initView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initView() {
        
    }
   
    func initModule() {
        
        var presenter: PresenterProtocol? = LoginPresenter()
        var interactor: InteractorProtocol? = LoginInteractor()
        var wireframe: WireFrameProtocol? = LoginWireFrame(option: .Login)
        
        self.presenter = presenter
        
        presenter?.interactor = interactor
        presenter?.view = self
        presenter?.wireframe = wireframe
        
        interactor?.presenter = presenter
        
        wireframe?.presenter = presenter
        wireframe?.view = self
    }
}

