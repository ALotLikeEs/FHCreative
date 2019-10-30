
//
//  companyModel.swift
//  FHCreative
//
//  Created by Admin on 25/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import Foundation

struct Company: Codable {
    var addedByID : String //Foreign key to users//
    var companyLogo : URL
    var companyName : String
    var companyTel : Int
    var companyEmail: String
    var companyTown : String
    var companyCity : String
    var companyCountry : String
    
    init(addedByID : String, companyLogo : URL, companyName : String, companyTel : Int, companyEmail: String, companyTown : String, companyCity : String, companyCountry : String){
        self.addedByID =  addedByID
        self.companyLogo = companyLogo
        self.companyName = companyName
        self.companyTel = companyTel
        self.companyEmail = companyEmail
        self.companyTown = companyTown
        self.companyCity = companyCity
        self.companyCountry = companyCountry
    }
}
