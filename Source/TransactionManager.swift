//
//  TransactionManager.swift
//  Gist Meister
//
//  Created by Dennis on 08/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON


class TransactionManager: NSObject {
    
    static let shared = TransactionManager()
    var authenticationHeaders = [String: String]()
    let apiURL = "https://api.github.com"
    
    // Progress indicator
    func invokeSVProgressHUD() {
        SVProgressHUD.show()
        SVProgressHUD.setMinimumDismissTimeInterval(2.5)
    }
    
    func processResponse(_ description: String, statusCode: Int, data: Data, completion: (JSON) -> ()) {
        switch(statusCode) {
        case 200:
            // Hide progress indicator
            SVProgressHUD.dismiss()
            
            let json = try! JSON(data: data)
            
            // Callback function
            completion(json)
            
        case 401:
            SVProgressHUD.showError(withStatus: String(describing: "\(description) failed"))
            
        default:
            SVProgressHUD.showError(withStatus: String(describing: "Call: \(description), unknown status code -> \(statusCode)"))
        }
    }
    
    // RESTful API: User Authentication
    func getAuthenticatedUser(username: String, password: String, completion: @escaping (JSON) -> ()) {
        invokeSVProgressHUD()
        
        // Encode user credentials
        let base64  = Data("\(username):\(password)".utf8).base64EncodedString()
        self.authenticationHeaders = ["Authorization": "Basic \(base64)"]
        
        // Make the Authentication request
        Alamofire.request("\(self.apiURL)/user", headers: self.authenticationHeaders).responseJSON { response in
            if let statusCode = response.response?.statusCode, let data = response.data {
                self.processResponse("Authentication", statusCode: statusCode, data: data, completion: completion)
            }
        }
    }
    
    // RESTful API: Gist
    func getGist(uid: String, completion: @escaping (JSON) -> ()) {
        invokeSVProgressHUD()
        
        // Prepare request URL
        let url = String(describing: "\(self.apiURL)/gists/\(uid)")
        
        // Encode user credentials
//        let base64  = Data("dkoluris:HAHA123qwe!@".utf8).base64EncodedString()
//        self.authenticationHeaders = ["Authorization": "Basic \(base64)"]
        
        // Make the Authentication request
        Alamofire.request(url, headers: self.authenticationHeaders).responseJSON { response in
            if let statusCode = response.response?.statusCode, let data = response.data {
                self.processResponse("Gist", statusCode: statusCode, data: data, completion: completion)
            }
        }
    }
    
    // RESTful API: Gist Comments
    func getGistComments(uid: String, completion: @escaping (JSON) -> ()) {
        invokeSVProgressHUD()
        
        // Prepare request URL
        let url = String(describing: "\(self.apiURL)/gists/\(uid)/comments")
        
        // Make the Authentication request
        Alamofire.request(url, headers: self.authenticationHeaders).responseJSON { response in
            if let statusCode = response.response?.statusCode, let data = response.data {
                self.processResponse("Gist Comments", statusCode: statusCode, data: data, completion: completion)
            }
        }
    }
}
