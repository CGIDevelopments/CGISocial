//
//  SettingsVC.swift
//  CGISocial
//
//  Created by Codie Featherstone on 07/10/2016.
//  Copyright © 2016 CgiDevelopments. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToFeedTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "settingsToFeed", sender: nil)
    }

    @IBAction func signOutTapped(_ sender: AnyObject) {
        let removeSuccessful = KeychainWrapper.standard.remove(key: KEY_UID)
        print("Isaac: ID removed from Keychain \(removeSuccessful)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "settingsToSignIn", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
