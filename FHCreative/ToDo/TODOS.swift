//
//  TODOS.swift
//  FHCreative
//
//  Created by Admin on 31/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import SwiftUI
import Firebase

struct TODOS: Identifiable {
    
    let key: String
    let todo: String
    let isComplete: String
    let id: String
    
    init(todo: String, isComplete: String, key: String = "") {
        self.ref = nil
        self.key = key
        self.todo = todo
        self.isComplete = isComplete
        self.id = key
        
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let todo = value["todo"] as? String,
            let isComplete = value["isComplete"] as? String
            else {
                return nil
            }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.todo = todo
        self.isComplete = isComplete
        self.id = snapshot.key
        
    }
    
    func toAnyObject() -> Any {
        return [
            "todo": todo,
            "isComplete": isComplete,
            
        ]
    }
