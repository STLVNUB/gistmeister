//
//  LoginView.swift
//  Gist Meister
//
//  Created by Dennis on 05/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class LoginView: UIViewController {
    // Interface outlets
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // Object instances
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if let username = usernameTextfield.text, let password = passwordTextfield.text {
            TransactionManager.shared.basicAuthentication(username: username, password: password, completion: { json in
                print(json)
            })
        }
    }
}
