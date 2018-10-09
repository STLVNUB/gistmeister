//
//  LoginView.swift
//  Gist Meister
//
//  Created by Dennis on 05/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit
import SwiftyJSON


class LoginView: UIViewController {
    // Interface outlets
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // User variables
    var userModel: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Theming
        ThemeManager.shared.navigationControllerColors(navigationController: self.navigationController!)
        
        // Customization
        usernameTextfield.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: UIColor.defaultTheme.textColor])
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.defaultTheme.textColor])
        
        // Remove this
        self.performSegue(withIdentifier: "segueToHome", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToHome" {
            if let viewController = segue.destination as? HomeView {
                viewController.userModel = self.userModel
            }
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        // Check if both credentials are available
        if let username = usernameTextfield.text, let password = passwordTextfield.text {
            TransactionManager.shared.basicAuthentication(username: username, password: password, completion: { json in
                self.userModel = json
                self.performSegue(withIdentifier: "segueToHome", sender: self)
            })
        }
    }
    
    @IBAction func reminderButtonPressed(_ sender: Any) {
    }
}
