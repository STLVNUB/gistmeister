//
//  GistView.swift
//  Gist Meister
//
//  Created by Dennis on 10/10/2018.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit


class GistView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Interface outlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var gistTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // Class variables
    let viewModel = GistViewModel()
    
    override func viewWillLayoutSubviews() {
        self.userImage.moa.url = "https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/12/2016/01/16578.jpg"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register sport cell
        self.tableView.register(UINib(nibName: "GistCommentTableViewCell", bundle: nil), forCellReuseIdentifier: "cellGistComment")
        //self.tableView.reloadData()
        
        // Cool looking UIImageView effect
        self.userImage.frostedGlassView()
        
        // Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // ViewModel handling
        if let uid = self.viewModel.gistID {
            self.viewModel.getGist(uid: uid, completion: { title in
                self.gistTitle.text = title
            })
        }
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
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.defaultTheme.secondaryTextColor
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Comments"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellGistComment", for: indexPath) as? GistCommentTableViewCell {
            return cell
        }
        
        return UITableViewCell()
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    // MARK: - IB actions
    @IBAction func sendButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
    }
}
