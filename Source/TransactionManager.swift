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
    
    func processResponse(_ description: String, statusCode: Int, data: Data, completion: (JSON) -> ()) {
        switch(statusCode) {
            case 200:
                let json = try! JSON(data: data)
            
                // Callback function
                completion(json)
            
            case 401:
                print(String(describing: "\(description) failed"))
            
            default:
                print(String(describing: "Call: \(description), unknown status code -> \(statusCode)"))
        }
        
        // Hide progress indicator
        SVProgressHUD.dismiss()
    }
    
    func basicAuthentication(username: String, password: String, completion: @escaping (JSON) -> ()) {
        // Progress indicator
        SVProgressHUD.show()
        
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
}
