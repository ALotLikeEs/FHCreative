//
//  AvatarView.swift
//  FHCreative
//
//  Created by Admin on 30/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import SwiftUI

struct AvatarView: View {
    
    /// image
    let image: String
    
    /// size
    let size: CGFloat
    
    /// body - default property for the view.
    var body: some View {
        
        Image(image)        // creates an imageview with specified image
            .resizable()    // makes image resizable
            .frame(width: size, height: size)       // frame for the image (width, height)
             // creates border around the image with 0.5 thikness - this will create rounded view outside the image.
            .border(Color.gray.opacity(0.5), width: 0.5)
            .cornerRadius(size/2)  // This will hide the cutting portion outside the rounded view border - this is required as per the documentation.
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(image:("skydiving"), size: 100)
    }
}
