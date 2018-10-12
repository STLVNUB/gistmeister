//
//  Extensions.swift
//  Gist Meister
//
//  Created by Dennis on 10/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


extension String {
    func UTCToLocal() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd/MM/YY h:mm a"
        
        return dateFormatter.string(from: dt!)
    }
}

extension UIImageView {
    func frostedGlassView() {
        let effect = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effect.frame = self.bounds
        self.addSubview(effect)
    }
}
