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
    
    func getSnapshotArray(collectionRef: String, completionHandler: @escaping (Array<Any>?, NSError?) -> ()){
        
        if let snapArray = self._snapshotArray {
            completionHandler(snapArray, nil)
        } else {
            
            var snapArray : Array<Any> = []
            
            db.collection(collectionRef).getDocuments { (snapshot, error) in
                guard let snapshot = snapshot else {
                    print("Error - > \(String(describing: error))")
                    return
                }
                
                for document in snapshot.documents {
                    let item = Industry(avatar: document.get("avatar") as! String, name:document.documentID, tags: document.get("tags") as! String)
                    snapArray.append(item)
                }
                self._snapshotArray = snapArray
                completionHandler(snapArray, error as NSError?)
            }
        }
    }
}
                             
