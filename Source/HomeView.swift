//
//  HomeView.swift
//  Gist Meister
//
//  Created by Dennis on 09/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit
import SwiftyJSON


class HomeView: UIViewController {
    var userModel: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Theming
        ThemeManager.shared.navigationControllerColors(navigationController: self.navigationController!)
    }
}
