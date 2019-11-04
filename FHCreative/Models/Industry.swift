//
//  Industry.swift
//  FHCreative
//
//  Created by Admin on 30/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import Foundation

struct Industry : Identifiable {
    
    var id = UUID()
    var avatar : String
    var name : String
    var tags : String

    init(avatar: String, name: String, tags: String) {
        self.avatar = avatar
        self.name = name
        self.tags = tags
    }
}

struct IndustryArray {
    
    var arrays : [Industry] = []

}

