//
//  TextPost.swift
//  CGISocial
//
//  Created by Codie Featherstone on 27/10/2016.
//  Copyright © 2016 CgiDevelopments. All rights reserved.
//

import Foundation


class TextPost {
    
    private var _caption: String!
    private var _likes: Int!
    private var _postKey: String!
    
    
    var caption: String {
        return _caption
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    
    init(caption: String, likes: Int) {
        self._caption = caption
        self._likes = likes
    }
    
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let likes = postData["likes"] as? Int  {
            self._likes = likes
        }
        
    }
    
}
