//
//  SignInVC.swift
//  CGISocial
//
//  Created by Codie Featherstone on 28/09/2016.
//  Copyright © 2016 CgiDevelopments. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase


class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookbuttonTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in if error != nil {
            print("Isaac: Unable to authenticate with Facebook - \(error)")
        } else if result?.isCancelled == true {
            print("Isaac: User cancelled Facebook authentication")
        } else {
            print("Isaac: Succsessfully authentication with Facebook")
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            self.firebaseAuth(credential)
            }
        }

    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in if error != nil {
            print("Isaac: Unable to connect with Firebase - \(error)")
        } else {
            print("Isaac: successfully authenticated with Firebase")
            }
        })
    }

}
