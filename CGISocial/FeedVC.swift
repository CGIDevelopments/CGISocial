//
//  FeedVC.swift
//  CGISocial
//
//  Created by Codie Featherstone on 07/10/2016.
//  Copyright © 2016 CgiDevelopments. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var postFeedTV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        postFeedTV.delegate = self
        postFeedTV.dataSource = self
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "ImagePostCell") as! ImagePostCell
    }
    
    
    @IBAction func settingsButtonTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "feedToSettings", sender: nil)
    }

}
