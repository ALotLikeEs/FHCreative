//
//  IndustryData.swift
//  FHCreative
//
//  Created by Admin on 30/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import Foundation
import SwiftUI

struct IndustryData {
    
    static func industryPosts()-> [Industry] {
                
        var snapArray = Array<Any>()
        
        //Get documents under 'industry' collection
        db.collection("industry").getDocuments() { (snapshot, error) in

            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                                
                for document in snapshot!.documents {
                    
                   let item = Industry(avatar: document.get("avatar") as! String, name:document.documentID, tags: document.get("tags") as! String)
                    
                    //Add snapshot items to an array
                    snapArray.append(item)
                    
                    print("\(snapArray)")
                    //Returns [FHCreative.Industry(id: 54DB00E3-C07E-4CF4-94E9-2B1F6929655D, avatar: "advertising", name: "Advertising", tags: "design, pr, creative")]
                }
            }
        }
        print("\(snapArray)")
        //Returns []
        
        return snapArray as! [Industry]
    }
}
