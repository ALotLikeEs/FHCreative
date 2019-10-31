//
//  IndustryView.swift
//  FHCreative
//
//  Created by Admin on 30/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import SwiftUI

struct IndustryRow: View {
    
    let industry : Industry
    
    var body: some View {
        
        HStack {
            Image(industry.avatar).resizable().frame(width: 100, height: 100).aspectRatio(contentMode: .fit)
            
            VStack{
                Text(industry.name).font(.body).multilineTextAlignment(.leading)
                Text(industry.tags).font(.caption).multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
    }
}

struct IndustryRow_Previews: PreviewProvider {
    static var previews: some View {
        IndustryRow(industry: Industry.init(avatar: "advertising", name: "Advertising", tags: "Communication, Logo"))
    }
}
