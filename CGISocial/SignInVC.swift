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
import SwiftKeychainWrapper


class SignInVC: UIViewController {

    @IBOutlet weak var passwordTextField: SignInTextField!
    
    @IBOutlet weak var emailTextField: SignInTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let retrievedString = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("Isaac: Sign in Info \(retrievedString)")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
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
            if let user = user {
                self.completeSignIn(id: user.uid)
            }
            }
        })
    }

    @IBAction func signInTapped(_ sender: AnyObject) {
        if let email = emailTextField.text {
        if let password = passwordTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in if error == nil {
                print("Isaac: Email user authenticated with Firebase")
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
            } else {
                FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in if error != nil {
                    print("Isaac: Unable to authenticated user with Firebase")
                } else {
                    print("Isaac: Successfully authenticated user with Firebase")
                    if let user = user {
                        self.completeSignIn(id: user.uid)
                    }
                    }
                    
                })
        }
        })
    }
}
}

    
    func completeSignIn(id: String) {
        let saveSuccessful = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Isaac: Data saved to Keychain \(saveSuccessful)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
}

