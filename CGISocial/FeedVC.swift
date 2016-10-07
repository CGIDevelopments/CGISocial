//
//  FeedVC.swift
//  CGISocial
//
//  Created by Codie Featherstone on 07/10/2016.
//  Copyright © 2016 CgiDevelopments. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsButtonTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "feedToSettings", sender: nil)
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
