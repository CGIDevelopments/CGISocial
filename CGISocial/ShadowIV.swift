//
//  ShadowIV.swift
//  CGISocial
//
//  Created by Codie Featherstone on 11/10/2016.
//  Copyright © 2016 CgiDevelopments. All rights reserved.
//

import UIKit

class ShadowIV: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(netHex: 0x424242).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 4.0
        
        
    }

}
