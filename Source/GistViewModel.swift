//
//  GistViewModel.swift
//  Gist Meister
//
//  Created by Dennis Koluris on 10/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit

class GistViewModel: NSObject {
    // Class variables
    var gistModel: GitHubModelGist?
    var qrString: String?
    
    func getGist(uid: String, completion: @escaping (String) -> ()) {
        TransactionManager.shared.getGist(uid: uid, completion: { json in
            self.gistModel = GitHubModelGist(fromJson: json)
            
            // Get named parameter
            let files = json["files"]
            var name: String?
            
            for file in files {
                name = file.0
                break
            }
            
            if name != nil {
                let model = GitHubModelGistDetails(fromJson: files[name!])
                completion(model.filename)
                
                //print(model.content)
                //print(self.gistModel?.comments)
            }
        })
    }
}
