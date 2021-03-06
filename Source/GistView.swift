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
    @IBOutlet weak var gistContent: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userCommentTextField: UITextField!
    
    // Class variables
    let viewModel = GistViewModel()
    
    override func viewWillLayoutSubviews() {
        self.userImage.moa.url = self.viewModel.imageURL
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register sport cell
        self.tableView.register(UINib(nibName: "GistCommentTableViewCell", bundle: nil), forCellReuseIdentifier: "cellGistComment")
        
        // Cool looking UIImageView effect
        self.userImage.frostedGlassView()
        
        // Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // ViewModel handling
        getGistDetails()
    }
    
    func getGistDetails() {
        if let uid = self.viewModel.gistID {
            self.viewModel.getGist(uid: uid, completion: { details in
                self.gistTitle.text = details[0]
                self.gistContent.text = details[1]
            }, completion2: {
                self.tableView.reloadData()
                self.scrollToBottom()
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
        // We just have one section as per requirements
        return "Comments"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.gistCommentsModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellGistComment", for: indexPath) as? GistCommentTableViewCell {
            // Get proper formatted data from ViewModel
            cell.labelUser.text = self.viewModel.parseUsername(indexPath.row)
            cell.labelDate.text = self.viewModel.parseDate(indexPath.row)
            cell.labelComment.text = self.viewModel.parseComment(indexPath.row)
            
            // Customization of cell
            cell.selectionStyle = .none
            
            return cell
        }
        
        // Unlikely
        return UITableViewCell()
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func scrollToBottom() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.viewModel.gistCommentsModelArray.count-1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    // MARK: - IB actions
    @IBAction func sendButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
        
        // Post comment
        if let uid = self.viewModel.gistID {
            if self.userCommentTextField.text != "" {
                TransactionManager.shared.postGistComment(uid: uid, text: self.userCommentTextField.text!, completion: { json in
                    // Reset textfield and get all details
                    self.userCommentTextField.text = ""
                    self.getGistDetails()
                })
            }
        }
    }
}
