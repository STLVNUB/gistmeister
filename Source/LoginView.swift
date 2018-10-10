//
//  LoginView.swift
//  Gist Meister
//
//  Created by Dennis on 05/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


class LoginView: UIViewController, UITextFieldDelegate {
    // Interface outlets
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // Class variables
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // Theming
        ThemeManager.shared.navigationControllerColors(navigationController: self.navigationController!)
        
        // Customization
        self.usernameTextfield.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: UIColor.defaultTheme.secondaryTextColor])
        self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.defaultTheme.secondaryTextColor])
        
        // Delegates
        self.passwordTextfield.delegate = self
        
        // Remove this
        //self.performSegue(withIdentifier: "segueToHome", sender: self)
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
                viewController.viewModel.userModel = self.viewModel.userModel
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // Offset movement of whole screen to accommodate the keyboard
    @objc func keyboardWillShow(_ notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        self.view.frame.origin.y = -keyboardFrame.size.height
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    // MARK: IB actions
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
        
        // ViewModel handling
        self.viewModel.getAuthenticatedUser(username: self.usernameTextfield.text, password: self.passwordTextfield.text, completion: {
            self.performSegue(withIdentifier: "segueToHome", sender: self)
        })
    }
    
    @IBAction func reminderButtonPressed(_ sender: Any) {
    }
}
