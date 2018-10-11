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
    var imageURL: String?
    
    func getGist(uid: String, completion: @escaping ([String]) -> (), completion2: @escaping () -> ()) {
        // Get Gist's details
        TransactionManager.shared.getGist(uid: uid, completion: { json in
            // Get named parameter
            let files = json["files"]
            var name: String?
            
            // GitHub's feed has a weird structure, we're getting the first name we find
            for file in files {
                name = file.0
                break
            }
            
            // If indeed we got a name for the Gist, proceed
            if name != nil {
                let model = GitHubModelGistDetails(fromJson: files[name!])
                completion([model.filename, model.content]) // Fill in the first batch of data, name & content
                
                // Check if we have a valid Gist ID
                if let uid = self.gistID {
                    // Get all Gist's comments
                    TransactionManager.shared.getGistComments(uid: uid, completion: { json in
                        self.gistCommentsModelArray = []
                        
                        for (_, body) in json {
                            self.gistCommentsModelArray.append(GitHubModelGistComments(fromJson: body))
                        }
                        
                        completion2() // Fill in the second batch of data, comments
                    })
                }
                else {
                    // Unhandled case, present user with an error
                }
            }
            else {
                // Unhandled case, present user with an error
            }
        })
    }
}
