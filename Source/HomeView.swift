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
    var viewModel = HomeViewModel()
    
    override func viewWillLayoutSubviews() {
        self.userSmallImage.layer.cornerRadius = self.userSmallImage.frame.size.width / 2
        self.userSmallImage.layer.borderWidth = 1
        self.userSmallImage.layer.borderColor = UIColor(red:255/255.0, green:255/255.0, blue:255/255.0, alpha: 1).cgColor
        
        // Check for valid data
        if let data = self.viewModel.userModel {
            if let avatar = data.avatarUrl {
                self.userImage.moa.url = avatar
                self.userSmallImage.moa.url = avatar
            }
            
            if let repos = data.publicRepos {
                self.userRepos.text = String(describing: "Repos: \(repos)")
            }
            
            if let followers = data.followers {
                self.userFollowers.text = String(describing: "Followers: \(followers)")
            }
            
            if let fullname = data.name {
                self.userFullName.text = fullname
            }
            
            if let username = data.login {
                self.userScreenName.text = String(describing: "@\(username)")
            }
            
            if let description = data.bio {
                self.userDescription.text = description
            }
            
            if let location = data.location {
                self.userLocation.text = location
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cool looking UIImageView effect
        self.userImage.frostedGlassView()
        
        // Theming
        ThemeManager.shared.navigationControllerColors(navigationController: self.navigationController!)
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.isTranslucent = true
        }
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
                viewController.viewModel.gistID = self.viewModel.gistID
                viewController.viewModel.imageURL = self.userImage.moa.url
            }
        }
    }
    
    // QR Code has been scanned with success
    func qrScannerSuccess() {
        self.performSegue(withIdentifier: "segueToGist", sender: self)
    }
    
    // MARK: - IB actions
    @IBAction func cameraButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToCamera", sender: self)
        //self.performSegue(withIdentifier: "segueToGist", sender: self)
    }
}
