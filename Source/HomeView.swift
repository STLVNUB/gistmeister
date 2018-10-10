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


class HomeView: UIViewController {
    // Interface outlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userSmallImage: UIImageView!
    @IBOutlet weak var userRepos: UILabel!
    @IBOutlet weak var userFollowers: UILabel!
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var userScreenName: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    
    // Class variables
    var userModel: GitHubModelUser?
    var qrString: String?
    
    override func viewWillLayoutSubviews() {
        self.userSmallImage.layer.cornerRadius = self.userSmallImage.frame.size.width / 2
        self.userSmallImage.layer.borderWidth = 1
        self.userSmallImage.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1).cgColor
        
        if let avatar = self.userModel?.avatarUrl {
            self.userImage.moa.url = avatar
            self.userSmallImage.moa.url = avatar
        }
        
        if let repos = self.userModel?.publicRepos {
            self.userRepos.text = String(describing: "Repos: \(repos)")
        }
        
        if let followers = self.userModel?.followers {
            self.userFollowers.text = String(describing: "Followers: \(followers)")
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
        
        if let location = self.userModel?.location {
            self.userLocation.text = location
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userImage.frostedGlassView()
        
        // Theming
        ThemeManager.shared.navigationControllerColors(navigationController: self.navigationController!)
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
    // Pass a reference of the current UIViewController in order to provide callback function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToCamera" {
            if let viewController = segue.destination as? CodeScannerView {
                viewController.homeView = self
            }
        }
        else if segue.identifier == "segueToGist" {
            if let viewController = segue.destination as? GistView {
                viewController.qrString = self.qrString
            }
        }
    }
    
    // QR Code has been scanned with success
    func qrScannerSuccess() {
        self.performSegue(withIdentifier: "segueToGist", sender: self)
    }
    
    // MARK: IB actions
    @IBAction func cameraButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToCamera", sender: self)
    }
}
