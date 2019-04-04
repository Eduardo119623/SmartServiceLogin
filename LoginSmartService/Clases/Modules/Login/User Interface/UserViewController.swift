//
//  UserViewController.swift
//  LoginSmartService
//
//  Created by administrator on 4/3/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import UIKit

class UserViewController: SmartViewController, ViewProtocol {
    
    //MARK: - Protocol Stubs
    var presenter: PresenterProtocol?
    
    //MARK: - Local Variables
    var usersModels: Array<UserModel>!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var usersTableView: UITableView!
    
    @IBOutlet weak var exitAction: UIButton!
    // ACTION: - IBOutles
    @IBAction func outAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.usersTableView.delegate = self
        self.usersTableView.dataSource = self
        self.usersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
       
       
     
    }
    

   

}
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.usersModels == nil {
            return 0
        } else{
            return self.usersModels.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.initCell(user: self.usersModels[indexPath.row], key: indexPath.row)
        cell.selectionStyle = .none
        
        return cell
    }
   
    
    
}
