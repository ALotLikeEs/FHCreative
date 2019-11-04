//
//  IndustryData.swift
//  FHCreative
//
//  Created by Admin on 30/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import Foundation
import SwiftUI

class IndustryData {
    
    var _snapshotArray : Array<Any>?
    
    func getSnapshotArray(completionHandler: @escaping (Array<Any>?, NSError?) -> ()) -> () {
        
        if let snapArray = self._snapshotArray {
            completionHandler(snapArray, nil)
        } else {
            
            var snapArray : Array<Any> = []
            
            for _ in 1...5 {
                
                let item = Industry(avatar: "avatar", name : "document", tags: "tags")
                
                snapArray.append(item)
            }
            
            self._snapshotArray = snapArray
            completionHandler(snapArray, nil)
        }
    }
    
    
    func industryPosts()-> [Industry] {
        
        var myArray : Array<Any>? = []
        
        getSnapshotArray { (snapshotArray, error) in
            
            if snapshotArray != nil {
                myArray  = snapshotArray!
            } else {
                print("Got nothing)")
            }
        }
        
        print("Got this \(String(describing: myArray)))")
        return myArray as! [Industry]
    }
}
