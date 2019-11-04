//  CreateProfile.swift
//  FHCreative
//
//  Created by Admin on 23/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.

import SwiftUI

struct profileTabView : View {
    
    @State var selection = 0
    
    var body : some View {
        
        TabView (selection: $selection) {
            //View public profiles of people your connected to
            createProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }.tag(0)
            //View public profiles of people your connected to
            companyView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.3")
                        Text("Company")
                    }            }.tag(1)
            industryView()
                .tabItem {
                    VStack {
                        Image(systemName: "briefcase")
                        Text("Industry")
                    }            }.tag(2)
            
            skillsView()
                .tabItem {
                    VStack {
                        Image(systemName: "paintbrush")
                        Text("Skills")
                    }            }.tag(3)
            //View users private profile - should link to profiles page
            settingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }            }.tag(4)
        }.background(Color("FHDusk"))
    }
}

struct createProfileView : View {
    
    @EnvironmentObject var session : SessionStore
    
    @State var firstname : String = ""
    @State var lastname : String = ""
    @State var cellphone : String = ""
    @State var dateOfBirth = Date()
    @State var dob : Double = 0
    @State var town : String = ""
    @State var country : String = ""
    @State var ratePerHour : Double = 0
    @State var userType : String = "user"
    @State var company : String = " "
    @State var rating : Int = 0
    @State var hasProfile = defaults.bool(forKey: "hasProfile")
    
    func isEnabled ()-> Bool {
        return !firstname.isEmpty && !lastname.isEmpty && !cellphone.isEmpty && !town.isEmpty && !country.isEmpty
    }
    
    func createProfile() {
        
        dob = convertDateToDouble(getDate: dateOfBirth)
        
        let params : [String:Any] = ["firstname" : firstname, "lastname" : lastname, "cellphone" : cellphone, "dateOfBirth" : dob, "town" : town, "country" : country, "ratePerHour" : ratePerHour, "company" : company, "userType" : userType, "rating": rating ]
        
        session.addDataWithDocRef(params: params, collectionReference: "users", documentReference: session.session?.uid ?? "")
        
        defaults.set(true, forKey: "hasProfile")
    }
    
    func updateProfile(){
        //Input the profile information into the fields
        session.getProfile(collectionReference: "users", documentReference: session.session!.uid)
        
        firstname = session.profile?.firstname ?? ""
        lastname = session.profile?.lastname ?? ""
        cellphone = session.profile?.cellphone ?? ""
        dob = session.profile?.dateOfBirth ?? 0
        town = session.profile?.town ?? ""
        country = session.profile?.country ?? ""
        ratePerHour = session.profile?.ratePerHour ?? 0
        company = session.profile?.company ?? ""
        rating = session.profile?.rating ?? 0
        userType = session.profile?.userType ?? ""
        dateOfBirth = convertDoubleToDate(dateAsDouble: dob)
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                Background(startColor: Color("FHDusk"), endColor: Color("FHCoral"))
                VStack {
                    VStack {
                        FHIconType(imageType: "light").resizable().aspectRatio(contentMode: .fit).frame(width:100, height: 100).padding(24)
                        
                        Text("Profile picture and Username are visible to the public. Name, Cell, DOB and address are private and are used when processing payment").font(.caption).foregroundColor(.white).frame(width:340, height: 45)
                    }
                    VStack {
                        CustomTextField(systemImageName: "person", textLabel: "firstname", inputText: $firstname)
                        CustomTextField(systemImageName: "person", textLabel: "lastname", inputText: $lastname)
                        CustomTextField(systemImageName: "phone", textLabel: "cellphone", inputText: $cellphone)
                        CustomTextField(systemImageName: "pin", textLabel: "town", inputText: $town)
                        CustomTextField(systemImageName: "map", textLabel: "country", inputText: $country)
                        Text("Date of birth").foregroundColor(.white)
                        DatePicker(
                            selection: $dateOfBirth,
                            //in: dateClosedRange,
                            displayedComponents: .date,
                            label: { Text("") }
                        ).foregroundColor(.white)
                        
                        //Text("Date of birth: \(formatDate(date: dateOfBirth))").foregroundColor(.white)
                        VStack {
                            Slider(value: $ratePerHour, in: 500...10000, step: 100)
                            Text("Rate per hour: \(doubleToString(getDouble: ratePerHour))")
                        }
                        Button(action:{
                            self.createProfile()
                        }){
                            BlueButton(buttonLabel: "Save", condition: isEnabled() )
                        }.disabled(!isEnabled())
                    }.onAppear(perform: updateProfile).frame(width:340)
                }
            }
        }
    }
}

struct companyView : View {
    
    @EnvironmentObject var session : SessionStore
    
    @State var companyName : String = ""
    @State var companyTel : String = ""
    @State var companyEmail : String = ""
    @State var companyTown : String = ""
    @State var companyCity : String = ""
    @State var companyCountry : String = ""
    @State var date : Double = 0
    @State var addedOnDate = Date()
    
    func isEnabled ()-> Bool {
        return !companyName.isEmpty && !companyTel.isEmpty && !companyEmail.isEmpty && !companyTown.isEmpty && !companyCity.isEmpty && !companyCountry.isEmpty
    }
    
    func addCompany() {
        
        date = convertDateToDouble(getDate: Date())
        
        let params : [String:Any] = ["companyName" : companyName, "companyTel" : companyTel, "companyEmail" : companyEmail, "companyCity": companyCity, "companyTown" : companyTown, "companyCountry" : companyCountry, "dateAdded" : date, "addedBy" : session.session?.uid as Any, "members" : 1]
        
        session.addDataWithDocRef(params: params, collectionReference: "company", documentReference: session.session?.uid)
        
        defaults.set(true, forKey: "hasProfile")
    }
    
    func updateCompany(){
        //Input the profile information into the fields
        session.getCompany(collectionReference: "company", documentReference: session.session!.uid)
        companyName = session.company?.companyName ?? ""
        companyTel = session.company?.companyTel ?? ""
        companyEmail = session.company?.companyEmail ?? ""
        companyTown = session.company?.companyTown ?? ""
        companyCity = session.company?.companyCity ?? ""
        companyCountry = session.company?.companyCountry ?? ""
        addedOnDate = convertDoubleToDate(dateAsDouble: date)
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                Background(startColor: Color("FHDusk"), endColor: Color("FHCoral"))
                VStack {
                    //Profile image icon
                    Image("CompanyLogo").resizable().aspectRatio(contentMode: .fill).frame(width: 120, height: 120).padding(24)
                    
                    Text("Company View").font(.title)
                    //Text fields
                    CustomTextField(systemImageName: "flag", textLabel: "company name", inputText: $companyName)
                    CustomTextField(systemImageName: "person", textLabel: "company tel no.", inputText: $companyTel)
                    CustomTextField(systemImageName: "phone", textLabel: "work email", inputText: $companyEmail)
                    CustomTextField(systemImageName: "pin", textLabel: "town", inputText: $companyTown)
                    CustomTextField(systemImageName: "pin", textLabel: "city", inputText: $companyCity)
                    CustomTextField(systemImageName: "map", textLabel: "country", inputText: $companyCountry)
                    
                    Button(action:{
                        self.addCompany()
                    }){
                        BlueButton(buttonLabel: "Save", condition: isEnabled() )
                    }.disabled(!isEnabled())
                    
                }.frame(width: 340)
            }.onAppear(perform: updateCompany)
        }
    }
}

struct industryView : View {
    
    //@EnvironmentObject var session : SessionStore
    
    var posts = IndustryData.industryPosts()

    var body: some View {
        
        NavigationView {
                        
            List {
                ForEach(posts) { post in
                    IndustryRow(industry: post)
                }
            }
        }
    }
}

struct skillsView : View {
    
    @State var companyName : String = ""
    @State var companyTel : String = ""
    @State var companyEmail : String = ""
    @State var companyTown : String = ""
    @State var companyCountry : String = ""
    
    var body: some View {
        NavigationView {
            Text("Hey")
        }
    }
}

struct settingsView : View {
    
    @State var companyName : String = ""
    @State var companyTel : String = ""
    @State var companyEmail : String = ""
    @State var companyTown : String = ""
    @State var companyCountry : String = ""
    
    var body: some View {
        
        ScrollView {
            
            ZStack {
                
                Background(startColor: Color("FHDusk"), endColor: Color("FHCoral"))
                
                VStack {
                    
                    //Profile image icon
                    Image("CompanyLogo").resizable().aspectRatio(contentMode: .fill).frame(width: 120, height: 120).padding(24)
                    
                    Text("Settings View").font(.title)
                    
                    //Text fields
                    CustomTextField(systemImageName: "flag", textLabel: "company name", inputText: $companyName)
                    CustomTextField(systemImageName: "person", textLabel: "tel no.", inputText: $companyTel)
                    CustomTextField(systemImageName: "phone", textLabel: "work email", inputText: $companyEmail)
                    CustomTextField(systemImageName: "pin", textLabel: "town", inputText: $companyTown)
                    CustomTextField(systemImageName: "map", textLabel: "country", inputText: $companyCountry)
                    Button(action: {}){
                        OutlineButton(buttonLabel: "Next").padding(24)
                    }
                }.frame(width: 340)
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        profileTabView()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        industryView()
    }
}
