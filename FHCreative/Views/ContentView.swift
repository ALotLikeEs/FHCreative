//
//  ContentView.swift
//  FHCreative
//
//  Created by Admin on 22/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @EnvironmentObject var session: SessionStore
    
    var newUser = defaults.bool(forKey: "newUser")
    var hasProfile = defaults.bool(forKey: "hasProfile")
    @State var profileView = 3
        
    var something : String = ""
    
    func getUser () {
        session.listen()
    }
    
    var body: some View {
        
        Group {
            if (session.session != nil) {
                if newUser == true {
                    OnboardingView()
                } else if hasProfile == false {
                    ProfileView()
                } else {
                    AppView()
                }
            } else {
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
    }
}
