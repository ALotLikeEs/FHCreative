//
//  dataArray.swift
//  FHCreative
//
//  Created by Admin on 05/11/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import Foundation

struct DataArray : Identifiable {
    
    var id: ObjectIdentifier?
    var dataArray: [Array<Any>]
    
    init(dataArray: [Array<Any>]){
        self.dataArray = dataArray
    }
    
}
