//
//  User.swift
//  FHCreative
//
//  Created by Admin on 22/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

class User {
    var uid: String
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
