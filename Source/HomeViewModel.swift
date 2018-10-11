//
//  HomeViewModel.swift
//  Gist Meister
//
//  Created by Dennis Koluris on 10/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


class HomeViewModel: NSObject {
    // Class variables
    var userModel: GitHubModelUser?
    var gistID: String?
    
    func extractGistID(url: String) {
        let parts = url.split(separator: "/")
        
        if parts.count == 4 && parts[1] == "gist.github.com" {
            self.gistID = String(describing: parts[3])
        }
    }
}
