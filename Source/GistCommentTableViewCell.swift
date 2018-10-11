//
//  GistCommentTableViewCell.swift
//  Gist Meister
//
//  Created by Dennis on 11/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit

class GistCommentTableViewCell: UITableViewCell {
    // Interface outlets
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
