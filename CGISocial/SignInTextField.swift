//
//  SignInTextField.swift
//  CGISocial
//
//  Created by Codie Featherstone on 28/09/2016.
//  Copyright © 2016 CgiDevelopments. All rights reserved.
//

import UIKit
/** extension to UIColor to allow setting the color
 value by hex value */
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        /** Verify that we have valid values */
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /** Initializes and sets color by hex value */
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}





@IBDesignable
class SignInTextField: UITextField, UITextFieldDelegate {
    
    
    
    
    
    // MARK: - IBInspectable
    @IBInspectable var tintCol: UIColor = UIColor(netHex: 0x707070)
    @IBInspectable var fontCol: UIColor = UIColor(netHex: 0x707070)
    @IBInspectable var shadowCol: UIColor = UIColor(netHex: 0x707070)
    
    
    
    
    // MARK: - Properties
    
    var textFont = UIFont(name: "Avenir Next", size: 17.0)
    
    
    
    
    
    override func draw(_ rect: CGRect) {
        self.layer.masksToBounds = false
        self.backgroundColor = UIColor(netHex: 0xE0E0E0)
        self.layer.cornerRadius = 4.0
        self.tintColor = tintCol
        self.textColor = fontCol
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(netHex: 0x424242).cgColor
        
        
        
        if let phText = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: phText, attributes: [NSForegroundColorAttributeName: UIColor(netHex: 0x616161)])
            
        }
        
        
        if accessibilityIdentifier == "Price" {
            self.keyboardType = UIKeyboardType(rawValue: 8)!
            self.attributedText = NSAttributedString(string: self.text!, attributes: [NSForegroundColorAttributeName: UIColor(netHex: 0x616161)])
            
        } else {
            self.keyboardType = UIKeyboardType(rawValue: 0)!
            self.attributedText = NSAttributedString(string: self.text!, attributes: [NSForegroundColorAttributeName: UIColor(netHex: 0x616161)])
        }
        
        
        
        if let fnt = textFont {
            self.font = fnt
        } else {
            self.font = UIFont(name: "Avenir Next", size: 17.0)
        }
    }
    
    // Placeholder text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    // Editable text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    
    
    
}