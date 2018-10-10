//
//  GistView.swift
//  Gist Meister
//
//  Created by Dennis on 10/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


class GistView: UIViewController {
    // Interface outlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var gistTitle: UILabel!
    
    // Class variables
    let viewModel = GistViewModel()
    
    override func viewWillLayoutSubviews() {
        self.userImage.moa.url = "https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/12/2016/01/16578.jpg"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cool looking UIImageView effect
        self.userImage.frostedGlassView()
        
        // Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // ViewModel handling
        self.viewModel.getGist(uid: "c36f3167b48893f50ea15b8dd456ac91", completion: { title in
            self.gistTitle.text = title
        })
    }
    
    // Offset movement of whole screen to accommodate the keyboard
    @objc func keyboardWillShow(_ notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        self.view.frame.origin.y = -keyboardFrame.size.height
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    // MARK: IB actions
    @IBAction func sendButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
    }
}
