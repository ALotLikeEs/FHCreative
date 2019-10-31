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
    
    @EnvironmentObject var session : SessionStore
    
    static func industryPosts()-> [Industry] {
        
        let ref = db.collection("industry").document("industry")
        
        var snapArray = []
        
        ref.addSnapshotListener(includeMetadataChanges: true) { (snapshot, error) in
            
            
            if let snapshot = snapshot {
                var item = snapshot.value(forKey: "")
                
            } else {
                print("\(error)")
            }
        }
        
        return
    }
}

//func snapToArray(collectionReference: String, documentReference: String?) -> [String:String] {
//
//    var snapshotArray = [String:String]()
//
//    // [START get_collection]
//    let data = db.collection(collectionReference).document(documentReference!)
//
//    data.addSnapshotListener(includeMetadataChanges: true) { (snapshot, error) in
//        if error == nil {
//            //Convert Snap to Array
//            for document in snapshot!.data()! {
//                snapshotArray.updateValue(document.value as! String, forKey: document.key)
//            }
//            print("Array: \(snapshotArray)")
//            print("Snapshot: \(String(describing: snapshot))")
//
//        } else {
//            print("Error creating snapshotArray: \(String(describing: error))")
//        }
//    }
//    return snapshotArray
//}
