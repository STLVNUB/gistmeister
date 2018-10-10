//
//  Extensions.swift
//  Gist Meister
//
//  Created by Dennis on 10/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


extension UIImageView {
    func frostedGlassView() {
        let effect = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effect.frame = self.bounds
        effect.alpha = 0.85
        self.addSubview(effect)
    }
}
