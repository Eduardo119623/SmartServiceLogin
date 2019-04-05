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
    
    @IBOutlet weak var imageUser: UIImageView!
    // ACTION: - IBOutles
    
    @IBAction func logiinAction(_ sender: UIButton) {
       self.passwordTextField.text =  self.passwordTextField.text?.replacingOccurrences(of: " ", with: "")
        self.userTextField.text = self.userTextField.text?.replacingOccurrences(of: " ", with: "")
        if !(self.passwordTextField.text!.isEmpty) && !(self.userTextField.text!.isEmpty) && self.passwordTextField.text == usersModels.first?.password && (self.userTextField.text == usersModels.first?.username || self.userTextField.text == usersModels.first?.email) {
            self.view.endEditing(true)
           (self.presenter as! LoginPresenter).showUser(users: self.usersModels)
            self.userTextField.text = ""
            self.passwordTextField.text = ""
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
        self.showLoader()
        (self.presenter as! LoginPresenter).requesUsers()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initView() {
        self.userTextField.placeholder = NSLocalizedString("userTextFieldPlaceHolder", comment: "userTextFieldPlaceHolder")
        self.passwordTextField.placeholder = NSLocalizedString("passwordTextFieldPlaceHolder", comment: "passwordTextFieldPlaceholder")
        self.logInButton.setTitle(NSLocalizedString("logInButtonText", comment:"logInButtonTextß"), for: .normal)
        self.navigationController?.navigationBar.isHidden = true
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
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //move textfields up
        let myScreenRect: CGRect = UIScreen.main.bounds
        let keyboardHeight : CGFloat = 300
        
        UIView.beginAnimations( "animateView", context: nil)
        //        var movementDuration:TimeInterval = 0.35
        var needToMove: CGFloat = 0
        
        var frame : CGRect = self.view.frame
        if (textField.frame.origin.y + textField.frame.size.height + UIApplication.shared.statusBarFrame.size.height > (myScreenRect.size.height - keyboardHeight - 30)) {
            needToMove = (textField.frame.origin.y + textField.frame.size.height + UIApplication.shared.statusBarFrame.size.height) - (myScreenRect.size.height - keyboardHeight - 30);
        }
        
        frame.origin.y = -needToMove
        self.view.frame = frame
        UIView.commitAnimations()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        //move textfields back down
        UIView.beginAnimations( "animateView", context: nil)
        //        var movementDuration:TimeInterval = 0.35
        var frame : CGRect = self.view.frame
        frame.origin.y = 0
        self.view.frame = frame
        UIView.commitAnimations()
    }
}
