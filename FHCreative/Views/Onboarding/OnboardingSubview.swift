//
//  Subview.swift
//  FHCreative
//
//  Created by Admin on 09/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import SwiftUI

struct OnboardingSubview: View {
    
    var imageString : String
    
    var titleString : String
    
    var body: some View {
        
        ZStack {
                Background(startColor: Color("FHEggplant"), endColor: Color("FHCoral"))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Image(imageString)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 600)
                        .clipped()
                    
                    Text(titleString)
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color("FHCoral"))
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
        }
    }
}

struct OnboardingSubview_Previews: PreviewProvider {
    @State static var index = 1
    static var previews: some View {
        OnboardingSubview(imageString: "OnboardingOne", titleString: "Create Account")
    }
}

//Background(startColor: Color("FHEggplant"), endColor: Color("FHCoral"))
//                 .edgesIgnoringSafeArea(.all)

