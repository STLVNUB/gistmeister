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
    var gistCommentsModelArray = [GitHubModelGistComments]()
    var gistID: String?
    
    func getGist(uid: String, completion: @escaping ([String]) -> (), completion2: @escaping () -> ()) {
        TransactionManager.shared.getGist(uid: uid, completion: { json in
            // Get named parameter
            let files = json["files"]
            var name: String?
            
            for file in files {
                name = file.0
                break
            }
            
            if name != nil {
                let model = GitHubModelGistDetails(fromJson: files[name!])
                completion([model.filename, model.content])
                
                if let uid = self.gistID {
                    TransactionManager.shared.getGistComments(uid: uid, completion: { json in
                        self.gistCommentsModelArray = []
                        
                        for (_, body) in json {
                            self.gistCommentsModelArray.append(GitHubModelGistComments(fromJson: body))
                        }
                        
                        completion2()
                    })
                }
            }
        })
    }
}
