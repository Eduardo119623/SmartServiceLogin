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
    var usersModels: Array<UserModel>!

     // MARK: - IBOutlets
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    // ACTION: - IBOutles
    
    @IBAction func logiinAction(_ sender: UIButton) {
        if !(self.passwordTextField.text!.isEmpty) && !(self.userTextField.text!.isEmpty) && (self.passwordTextField.text?.validatePasswordFormat())! && (self.userTextField.text?.validateUserNameFormat())! {
            self.showLoader()
            (self.presenter as! LoginPresenter).requesUsers()
        } else {
            let Alert: UIAlertController = UIAlertController(title: "Error", message: NSLocalizedString("ErrorFormat", comment: "ErrorFormat"), preferredStyle: .alert)
            Alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
            self.present(Alert, animated: true, completion: nil)
        }
       
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initModule()
        self.initView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initView() {
        self.userTextField.placeholder = NSLocalizedString("userTextFieldPlaceHolder", comment: "userTextFieldPlaceHolder")
        self.passwordTextField.placeholder = NSLocalizedString("passwordTextFieldPlaceHolder", comment: "passwordTextFieldPlaceholder")
        self.logInButton.setTitle(NSLocalizedString("logInButtonText", comment:"logInButtonTextß"), for: .normal)
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

