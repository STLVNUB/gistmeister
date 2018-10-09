//
//  ThemeManager.swift
//  Gist Meister
//
//  Created by Dennis on 09/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


// Extend definition with custom colors
extension UIColor {
    struct defaultTheme {
        static var backgroundColor: UIColor {
            return UIColor(red: 43/255.0, green: 61/255.0, blue: 83/255.0, alpha: 1)
        }
        
        static var highlightColor: UIColor {
            return UIColor(red: 0/255.0, green: 154/255.0, blue: 154/255.0, alpha: 1)
        }
        
        static var textColor: UIColor {
            return UIColor(red: 177/255.0, green: 185/255.0, blue: 195/255.0, alpha: 1)
        }
    }
}

class ThemeManager: NSObject {
    
    static let shared = ThemeManager()
    
    func navigationControllerColors(navigationController: UINavigationController) {
        navigationController.navigationBar.barTintColor = UIColor.defaultTheme.backgroundColor
        UINavigationBar.appearance().tintColor = UIColor.defaultTheme.highlightColor
        navigationController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}
