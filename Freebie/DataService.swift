//
//  DataService.swift
//  Freebie
//
//  Created by Vishal Vasan on 11/29/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import Foundation
import Firebase

let DB = FIRDatabase.database().reference()

class DataService {
    static let ds = DataService() 
    private var _REF_DB = DB
    private var _REF_FREEBIES = DB.child("Freebies")
    private var _REF_USERS = DB.child("Users")
    
    var REF_DB: FIRDatabaseReference {
        return _REF_DB
    }
    
    var REF_FREEBIES: FIRDatabaseReference {
        return _REF_FREEBIES
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
