//
//  PageControl.swift
//  FHCreative
//
//  Created by Admin on 11/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation

struct PageControl: UIViewRepresentable {
    
    var numberOfPages : Int
    
    @Binding var currentPageIndex: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = UIColor(named: "FHBabyBlue")
        control.pageIndicatorTintColor = UIColor.white
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
    }
}

