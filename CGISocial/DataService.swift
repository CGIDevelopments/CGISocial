//
//  DataService.swift
//  CGISocial
//
//  Created by Codie Featherstone on 26/10/2016.
//  Copyright © 2016 CgiDevelopments. All rights reserved.
//

import Foundation
import Firebase


let DB_BASE = FIRDatabase.database().reference()


class DataService {
    
    
    static let ds = DataService()
    
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_IMAGE_POSTS = DB_BASE.child("posts").child("imagePosts")
    private var _REF_TEXT_POSTS = DB_BASE.child("posts").child("textPosts")
    private var _REF_USERS = DB_BASE.child("users")
    
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_IMAGE_POSTS: FIRDatabaseReference {
        return _REF_IMAGE_POSTS
    }
    
    var REF_TEXT_POSTS: FIRDatabaseReference {
        return _REF_TEXT_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    
    
}
