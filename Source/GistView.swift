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
            
            // Get named parameter
            let files = json["files"]
            var name: String?
            
            for file in files {
                name = file.0
                break
            }
            
            if name != nil {
                let model = GitHubModelGistDetails(fromJson: files[name!])
                
                print(model.filename)
                print(model.content)
                print(self.gistModel?.comments)
            }
        })
    }
}
