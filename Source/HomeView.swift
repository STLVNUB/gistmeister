//
//  HomeView.swift
//  Gist Meister
//
//  Created by Dennis on 09/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit
import moa
import SwiftyJSON


extension UIImageView {
    func glassView() {
        let fx = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        fx.frame = self.bounds
        self.addSubview(fx)
    }
}

class HomeView: UIViewController {
    // Interface outlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var userScreenName: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    
    // Class variables
    var userModel: GitHubModelUser?
    
    override func viewWillLayoutSubviews() {
        if let avatar = self.userModel?.avatarUrl {
            self.userImage.moa.url = avatar
        }
        
        if let fullname = self.userModel?.name {
            self.userFullName.text = fullname
        }
        
        if let username = self.userModel?.login {
            self.userScreenName.text = String(describing: "@\(username)")
        }
        
        if let description = self.userModel?.bio {
            self.userDescription.text = description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userImage.glassView()
        
        // Theming
        ThemeManager.shared.navigationControllerColors(navigationController: self.navigationController!)
    }
}
