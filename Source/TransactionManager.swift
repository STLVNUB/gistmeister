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
    
    func getAuthenticatedUser(username: String, password: String, completion: @escaping (JSON) -> ()) {
        invokeSVProgressHUD()
        
        // Encode user credentials
        let base64  = Data("\(username):\(password)".utf8).base64EncodedString()
        let headers = ["Authorization": "Basic \(base64)"]
        
        // Make the Authentication request
        Alamofire.request("https://api.github.com/user", headers: headers).responseJSON { response in
            if let statusCode = response.response?.statusCode, let data = response.data {
                self.processResponse("Authentication", statusCode: statusCode, data: data, completion: completion)
            }
        }
    }
    
    func getGist(uid: String, completion: @escaping (JSON) -> ()) {
        invokeSVProgressHUD()
        
        // Preparation
        let url = String(describing: "https://api.github.com/gists/\(uid)")
        
        // Make the Authentication request
        Alamofire.request(url).responseJSON { response in
            if let statusCode = response.response?.statusCode, let data = response.data {
                self.processResponse("Gist", statusCode: statusCode, data: data, completion: completion)
            }
        }
    }
}
