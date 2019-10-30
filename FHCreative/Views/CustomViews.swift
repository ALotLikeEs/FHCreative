//
//  File.swift
//  FHCreative
//
//  Created by Admin on 09/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import SwiftUI
/// Custom Background reusable view
/// - Parameters:
///   - startColor: colour on top of gradient
///   - endColor: colour at bottom of gradient
func Background (startColor: Color, endColor: Color) -> some View {
    ZStack {
        Rectangle()
            .fill(LinearGradient.init(gradient: Gradient(colors: [startColor, endColor]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
    }
}

func BlueButton(buttonLabel: String, condition: Bool) -> some View {
    Text(buttonLabel)
        .font(.body)
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .frame(width: 200, height: 50, alignment: .center)
        .background(condition ? Color.gray : Color.blue )
        .cornerRadius(30)
        .padding(10)
}


func checkBoxImage(for state: Bool) -> Image {
    return state ? Image(systemName: "rectangle") : Image(systemName: "checkmark.rectangle")
}

func OutlineButton(buttonLabel: String) -> some View {
    VStack {
        Text(buttonLabel)
            .font(.callout)
            .foregroundColor(.white)
            .frame(width: 150, height: 40, alignment: .center)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(30)
    }
    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 2))
    .padding(10)
}

func CustomTextField(systemImageName: String, textLabel: String, inputText: Binding<String>) -> some View {
    HStack {
        Image(systemName: systemImageName)
            .padding(.leading, 12)
            .padding(.trailing, 6)
        
        TextField(textLabel, text: inputText)
            .foregroundColor(Color("FHDusk"))
            .frame(height:45)
    }
    .background(Color(.white))
    .cornerRadius(30)
    .padding(6)
}

func CustomPasswordField(systemImageName: String, textLabel: String, inputText: Binding<String>) -> some View {
    HStack {
        Image(systemName: systemImageName)
            .padding(.leading, 12)
            .padding(.trailing, 6)
        SecureField(textLabel, text: inputText)
            .foregroundColor(Color("FHDusk"))
            .frame(height:45)
        
    }
    .background(Color(.white))
    .cornerRadius(30)
    .padding(6)
}

func HeadingText(headingText: String) -> some View {
    Text(headingText)
        .font(.title)
        .foregroundColor(.white)
        .padding(20)
}

func CaptionText(captionText: String) -> some View {
    Text(captionText)
        .font(.footnote)
        .foregroundColor(.white)
        .padding(10)
}

func imageChecker() -> Image {
    Image(systemName: "trash")
}



func FHIconType(imageType:String) -> Image {
    
    
    let light : String = "light"
    let dark : String = "dark"
    let grey : String = "gray"
    
    switch imageType {
        
    case light:
        return Image("FHIconWhite")
        
    case dark:
        return Image("FHIconDark")
        
    case grey:
        return Image("FHIconGray")
        
    default:
        return Image("FHIconWhite")
    }
}

//Format dates to return a string with only a date without the time value
func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = DateFormatter.Style.none
    dateFormatter .dateStyle = DateFormatter.Style.short
    let dateAsString = dateFormatter.string(from: date)
    return dateAsString
}

func doubleToString (getDouble: Double) -> String {
    let double = String(getDouble)
    return double
}

func convertDoubleToDate(dateAsDouble: Double) -> Date {
    return Date(timeIntervalSince1970: TimeInterval(dateAsDouble)/1000)
}

func convertDateToDouble(getDate: Date) -> Double {
    let currentDate = getDate
    let since1970 = currentDate.timeIntervalSince1970
    return Double(since1970 * 1000)
}

struct CustomViews: View {
    
    @State private var emailText: String = ""
    
    var body: some View {
        VStack {
            CustomTextField(systemImageName: "trash", textLabel: "email", inputText: $emailText)
            OutlineButton(buttonLabel: "Create account")
        }
        .background(Color("FHBabyBlue"))
    }
    
    struct CustomViews_Previews: PreviewProvider {
        static var previews: some View {
            CustomViews()
        }
    }
}


