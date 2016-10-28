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
    
    
    var imagePosts = [ImagePost]()
    var textPosts = [TextPost]()

    override func viewDidLoad() {
        super.viewDidLoad()

        postFeedTV.delegate = self
        postFeedTV.dataSource = self
        
        DataService.ds.REF_TEXT_POSTS.observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    
                    if let textPostDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let textPost = TextPost(postKey: key, postData: textPostDict)
                        self.textPosts.append(textPost)
                    }
                }
            }
                        
           // self.postFeedTV.reloadData()
        })
        
         DataService.ds.REF_IMAGE_POSTS.observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    
                    if let imagePostDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let imagePost = ImagePost(postKey: key, postData: imagePostDict)
                        self.imagePosts.append(imagePost)
                    }
                }
            }
            self.postFeedTV.reloadData()
        })
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("ISAAC: \(imagePosts.count)")
        print("ISAAC: \(textPosts.count)")
        print("ISAAC1: \(imagePosts.count + textPosts.count)")
        return imagePosts.count + textPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let imagePost = imagePosts[indexPath.row]
        print("ISAAC: \(imagePost.caption)")
        print("CELL: \(imagePost)")
        let textPost = textPosts[indexPath.row]
        print("ISAAC: \(textPost.caption)")
        print("CELL: \(textPost)")
        
        if indexPath.row == 0 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImagePostCell") as! ImagePostCell
            //set the data here
            return cell
        }
        else {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TextPostCell") as! TextPostCell
            //set the data here
            return cell
        }
    }
    
    
    @IBAction func settingsButtonTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "feedToSettings", sender: nil)
    }

}
