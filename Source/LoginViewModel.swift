//
//  LoginViewModel.swift
//  Gist Meister
//
//  Created by Dennis on 05/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


class LoginViewModel: NSObject {
    // Class variables
    var userModel: GitHubModelUser?
    
    func getAuthenticatedUser(username: String?, password: String?, completion: @escaping () -> ()) {
        // Check if both credentials are available
        if username != nil && password != nil {
            TransactionManager.shared.getAuthenticatedUser(username: username!, password: password!, completion: { json in
                self.userModel = GitHubModelUser(fromJson: json)
                completion()
            })
        }
    }
}
