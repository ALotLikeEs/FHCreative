
//
//  companyModel.swift
//  FHCreative
//
//  Created by Admin on 25/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import Foundation

struct Company: Codable {
    var addedOnDate : Double
    var companyName : String
    var companyTel : String
    var companyEmail: String
    var companyTown : String
    var companyCity : String
    var companyCountry : String
    var companyID : String
    var addedBy : String
    var members : Int
    
<<<<<<< HEAD
    init(companyLogo : String, companyName : String, companyTel : String, companyEmail: String, companyTown : String, companyCity : String, companyCountry : String, addedOnDate: Double){
=======
    init(companyName : String, companyTel : String, companyEmail: String, companyTown : String, companyCity : String, companyCountry : String, addedOnDate: Double, companyID: String, addedBy: String, members:Int){
>>>>>>> Update 'company' data model
        self.companyName = companyName
        self.companyTel = companyTel
        self.companyEmail = companyEmail
        self.companyTown = companyTown
        self.companyCity = companyCity
        self.companyCountry = companyCountry
        self.addedOnDate  = addedOnDate
<<<<<<< HEAD
=======
        self.companyID = companyID
        self.addedBy = addedBy
        self.members = members
>>>>>>> Update 'company' data model
    }
}
