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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var postFeedTV: UITableView!
    @IBOutlet weak var imageAdd: ShadowIV!
    
    
    var imagePosts = [ImagePost]()
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        postFeedTV.delegate = self
        postFeedTV.dataSource = self
        
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
    
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

        return imagePosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let imagePost = imagePosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ImagePostCell") as? ImagePostCell {
            cell.configureCell(imagePost: imagePost)
            return cell
        } else {
            return ImagePostCell()
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageAdd.image = image
        } else {
            print("ISAAC: A valid image wasn't selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addImageTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func settingsButtonTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "feedToSettings", sender: nil)
    }

}
