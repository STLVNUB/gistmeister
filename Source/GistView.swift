//
//  GistView.swift
//  Gist Meister
//
//  Created by Dennis on 10/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


class GistView: UIViewController {
    
    // Class variables
    var gistModel: GitHubModelGist?
    var qrString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TransactionManager.shared.getGist(uid: "c36f3167b48893f50ea15b8dd456ac91", completion: { json in
            self.gistModel = GitHubModelGist(fromJson: json)
            
            if let dictionary = json as? [String: Any], let emergencyNumbers = dictionary["EmergencyNumbers"] as? [[String: Any]]
            {
                emergencyNumbers.forEach { numbers in
                    print(numbers["Description"] as? String)
                    print(numbers["Id"] as? Int)
                    print(numbers["Number"] as? Int)
                }
            }
            
            //print(String(describing: self.gistModel?.files.sampleGist.filename))
            //print(String(describing: self.gistModel?.files.sampleGist.content))
            //print(String(describing: self.gistModel?.comments))
        })
    }
}
