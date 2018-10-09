//
//  ThemeManager.swift
//  Gist Meister
//
//  Created by Dennis on 09/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


class ThemeManager: NSObject {
    
    static let shared = ThemeManager()
    
    func navigationControllerColors(navigationController: UINavigationController) {
        navigationController.navigationBar.barTintColor = UIColor(red: 43/255.0, green: 61/255.0, blue: 83/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor(red: 0/255.0, green: 154/255.0, blue: 154/255.0, alpha: 1.0)
        navigationController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}
