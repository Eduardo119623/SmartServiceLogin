//
//  SmartViewController.swift
//  LoginSmartService
//
//  Created by administrator on 4/2/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import UIKit

class SmartViewController: UIViewController {

    var loader: WOPLoader?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func showLoader(container: UIView? = nil, endEditing: Bool = true, backgroundColor: UIColor = .white, inSuperView: Bool = true) {
        if endEditing {
            self.view.endEditing(true)
        }
        
        if self.loader == nil {
            self.loader = WOPLoader()
            loader?.showLoader(in: container, backgroundColor: backgroundColor, inSuperView: inSuperView)
        }
    }
    
    func removeLoader(endEditing: Bool = true) {
        if endEditing {
            self.view.endEditing(true)
        }
        if let wopLoader = self.loader {
            wopLoader.removeLoader()
            self.loader = nil
        }
    }
    func setTitle(_ title: String) {
        
        var showTag = true
        
        if let items = self.navigationItem.leftBarButtonItems {
            if items.count > 1 {
                showTag = false
            } else {
                showTag = true
            }
        } else {
            showTag = true
        }
        
        if showTag {
            self.navigationController?.navigationBar.tintColor = UIColor.lightGray
            self.navigationController?.navigationItem.title = title
            self.tabBarController?.navigationItem.title = title
            self.navigationItem.title = title
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
