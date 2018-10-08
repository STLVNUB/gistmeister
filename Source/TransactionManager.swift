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
        let base64  = Data("\(username):\(password)".utf8).base64EncodedString()
        let headers = ["Authorization": "Basic \(base64)"]
        
        Alamofire.request("https://api.github.com/user", headers: headers).responseJSON { response in 
            if response.data != nil {
                let json = try! JSON(data: response.data!)
                completion(json)
            }
            else {
                // FAIL
            }
        }
    }
}
