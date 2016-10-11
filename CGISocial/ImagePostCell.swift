//
//  ImagePostCell.swift
//  CGISocial
//
//  Created by Codie Featherstone on 11/10/2016.
//  Copyright © 2016 CgiDevelopments. All rights reserved.
//

import UIKit

class ImagePostCell: UITableViewCell {
    
    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var usernameL: UILabel!
    @IBOutlet weak var likeIV: UIImageView!
    @IBOutlet weak var postImageIV: ShadowIV!
    @IBOutlet weak var postTextTV: PostTextView!
    @IBOutlet weak var likesNumberL: UILabel!
    @IBOutlet weak var likesL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
