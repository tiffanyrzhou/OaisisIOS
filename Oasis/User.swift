//
//  User.swift
//  Oasis
//
//  Created by Tiffany Zhou on 3/1/17.
//  Copyright © 2017 Turbo Ocelots. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
struct User {
    
    
    let key: String
    let uid: String
    let email: String
    let userType: UserType
    let phone: String
    let title: String
    let name : String
    let home : String
    let ref: FIRDatabaseReference?

    
    
    init(authData: FIRUser) {
        self.key = "key";
        uid = authData.uid
        email = authData.email!
        self.userType = UserType.Reporter
        self.phone = ""
        self.title = ""
        self.name = ""
        self.home = ""
        self.ref = nil

        
    }
    init(authData: FIRUser, userType : UserType) {
        self.key = "key";
        uid = authData.uid
        email = authData.email!
        self.userType = userType;
        self.phone = " "
        self.title = " "
        self.name = " "
        self.home = " "
        self.ref = nil
        
        
    }
    
//    init(uid: String, email: String, userType: UserType, title: String, name : String,
//         home: String , phone : String) {
//        self.key = "key";
//        self.uid = uid
//        self.email = email
//        self.userType = userType
//        self.phone = phone
//        self.title = title
//        self.name = name
//        self.home = home
//        self.ref = nil
//
//    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        uid = snapshotValue["uid"] as! String
        name = snapshotValue["name"] as! String
        email = snapshotValue["email"] as! String
        userType = snapshotValue["usertype"] as! UserType
        title = snapshotValue["title"] as! String
        phone = snapshotValue["phone"] as! String
        home = snapshotValue["homeaddress"] as! String
        ref = snapshot.ref
    }
    
    
        func toNSDictionary() -> NSDictionary {
        return [
        "uid": self.uid,
        "email": self.email,
        "usertype": self.userType,
        "title": self.title,
        "name": self.name,
        "homeaddress": self.home,
        "phone" : self.phone
        ] as NSDictionary;
        }
    

    
    func toAnyObject() -> Any {
        return [
            "uid" : uid,
            "email" : email,
            "usertype": userType,
            "title" : title,
            "name": name,
            "homeaddress" : home,
            "phone" : phone
        ]
    }
    
}

