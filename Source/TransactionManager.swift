//
//  TransactionManager.swift
//  Gist Meister
//
//  Created by Dennis on 08/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class TransactionManager: NSObject {
    
    static let shared = TransactionManager()
    
    func basicAuthentication(username: String, password: String, completion: @escaping (JSON) -> ()) {
        // Encode user credentials
        let base64  = Data("\(username):\(password)".utf8).base64EncodedString()
        let headers = ["Authorization": "Basic \(base64)"]
        
        // Make the Authentication request
        Alamofire.request("https://api.github.com/user", headers: headers).responseJSON { response in
            if let statusCode = response.response?.statusCode {
                switch(statusCode) {
                case 200:
                    if response.data != nil {
                        let json = try! JSON(data: response.data!)
                        
                        // Callback function
                        completion(json)
                    }
                    else {
                        // FAIL
                    }
                    
                case 401:
                    print("Authentication failed!")
                    
                default:
                    print("Unknown Status Code -> \(statusCode)")
                }
            }
        }
    }
}
