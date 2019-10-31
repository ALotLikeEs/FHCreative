//
//  userProfile.swift
//  FHCreative
//
//  Created by Admin on 23/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import Foundation

class UserProfile : Codable, Identifiable {
    
    let userID : String
    var firstname : String
    var lastname : String
    var cellphone : String
    var dateOfBirth : Double
    var town : String
    var country : String
    var ratePerHour : Double
    var userType : String
    var rating : Int
    var company: String
    var industry: String
       
    init(userID: String, firstname: String, lastname: String, cellphone: String, dateOfBirth: Double, town: String, country: String, ratePerHour: Double, userType: String, rating : Int, company: String, industry : String) {
        self.userID = userID
        self.firstname = firstname
        self.lastname = lastname
        self.cellphone = cellphone
        self.dateOfBirth = dateOfBirth
        self.town = town
        self.country = country
        self.ratePerHour = ratePerHour
        self.userType = userType
        self.rating = rating
        self.company = company
        self.industry = industry
    }
}
