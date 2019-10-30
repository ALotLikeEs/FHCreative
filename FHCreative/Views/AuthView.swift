//
//  Authenticationview.swift
//  FHCreative
//
//  Created by Admin on 22/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import SwiftUI
//Mark : -> Landing View
struct AuthView: View {
    @EnvironmentObject var session: SessionStore
    var body : some View {
        NavigationView {
                mySigninView()
            }
        }
    }

//Mark : -> Signup View
struct mySignupView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @State var loading = false
    @State var error = false
    @State var message: String = ""
    
    @EnvironmentObject var session: SessionStore
    
    func isEnabled ()-> Bool {
        return !email.isEmpty && !password.isEmpty && password.count > 7
    }
    
    func signUp () {
        print("sign me up")
        loading = true
        error = false
        session.signUp(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.message = error!.localizedDescription
                print("\(String(describing: error))")
                self.error = true
            } else {
                self.email = ""
                self.password = ""
                self.message = "Signup Successful"
                
                //Set defaults
                defaults.set(true, forKey: "newUser")
                defaults.set(false, forKey: "hasProfile")
            }
        }
    }
    
    var body : some View {
        ZStack {
            Background(startColor: Color("FHBabyBlue"), endColor: Color("FHCoral"))
            VStack {
                FHIconType(imageType: "light").resizable().aspectRatio(contentMode: .fit).frame(width: 100)
                HeadingText(headingText: "Sign up")
                CustomTextField(systemImageName: "envelope", textLabel: "email", inputText: $email)
                CustomPasswordField(systemImageName: "lock", textLabel: "password", inputText: $password)
                if (error) { Text("\(message)").font(.caption).foregroundColor(.white) }
                Button(action: signUp) { BlueButton(buttonLabel: "Sign up", condition: isEnabled() ) }
                
                VStack {
                    Text("By signing up to FH, your're agreeing").font(.footnote).foregroundColor(.white)
                    Button(action:{}){
                        Text("to our terms and conditions").bold().font(.footnote).foregroundColor(.white)
                    }
                    Button(action:{}){
                        Text("Read our Privacy Policy").bold().font(.footnote).foregroundColor(.white).frame(height:40)
                    }
                }.frame(width: 350).padding()
            }
        }
    }
}

//Mark : -> Signin View
struct mySigninView: View {
    @State var rememberMe : Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    @State var message: String = ""
    
    @EnvironmentObject var session: SessionStore
    
    func isEnabled ()-> Bool {
        return !email.isEmpty && !password.isEmpty && password.count > 7
    }
    
    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
                self.message = error!.localizedDescription
            } else {
                print("Signin success")
            }
        }
    }
    
    var body : some View {
        ZStack {
            Background(startColor: Color("FHBabyBlue"), endColor: Color("FHCoral"))
            VStack {
                Spacer()
                FHIconType(imageType: "light").resizable().aspectRatio(contentMode: .fit).frame(width: 100).padding(20)
                HeadingText(headingText: "Sign in")
                CustomTextField(systemImageName: "envelope", textLabel: "email", inputText: $email)
                CustomTextField(systemImageName: "lock", textLabel: "password", inputText: $password)
                Button(action: signIn) {
                    VStack {
                        BlueButton(buttonLabel: "Sign in", condition: isEnabled())
                        Text("\(message)")
                            .font(.caption).foregroundColor(.white).lineLimit(2).padding()
                    }
                }
                Spacer()
                HStack {
                    Button(action: {
                        if self.rememberMe == false {
                            self.rememberMe = true
                        } else if self.rememberMe == true {
                            self.rememberMe = false
                        }
                    }) {
                        checkBoxImage(for: rememberMe).foregroundColor(.white)
                        CaptionText(captionText: "Remember me")
                    }
                    Spacer()
                    Button(action: {}){
                        CaptionText(captionText: "Forgot password?")
                    }
                }
                CaptionText(captionText: "Not a member?")
                NavigationLink(destination: mySignupView()) {
                    Text("Signup")
                }
            }.frame(width: 350).padding()
        }
    }
}

struct mySignupTerms: View {
    
    var body: some View {
        
        ZStack {
            
            Background(startColor: Color("FHBabyBlue"), endColor: Color("FHCoral"))
            
            VStack {
                
                Text("Terms & Conditions\n").bold()
                
                Text("Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. \n\nThe Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way. When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. \n\nPityful a rethoric question ran over her cheek, then. Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. \n\n Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. \n\nThe Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way. When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. \n\nPityful a rethoric question ran over her cheek, then. Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. \n\n")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
            }
        .frame(width: 350)
        .padding()
        }
    }
}

struct myLandingView: View {
    
    @EnvironmentObject var session : SessionStore
    
    func getUser () {
        session.listen()
    }
    
    var body: some View {
        ZStack {
            Background(startColor: Color("FHCoral"), endColor: Color("FHBabyBlue"))
            ZStack {
                Image("Wobble")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                FHIconType(imageType: "Light")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 50, idealWidth: 100, maxWidth: 100)
                
                Group {
                    if (session.session != nil) {
                        Text("Hello user")
                    } else {
                        Text("Authenticate user")
                    }
                }
            }
        }
        
    }
}

struct mySignupResetPasswordView: View {
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    func isEnabled ()-> Bool {
           return !emailText.isEmpty && !passwordText.isEmpty && passwordText.count > 6
       }
    
    var body: some View {
        ZStack {
            Background(startColor: Color("FHBabyBlue"), endColor: Color("FHCoral"))
            
            VStack {
                
                Spacer()
                
                FHIconType(imageType: "light")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                // .padding(20)
                
                HeadingText(headingText: "Reset password")
                
                CustomTextField(systemImageName: "envelope", textLabel: "email", inputText: $emailText)
                
                Button(action: {
                    
                } ) {
                    BlueButton(buttonLabel: "Sign up", condition: isEnabled())
                }
                Spacer()
                
                Text("An email has been sent with a \n link to reset your password")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .frame(height: 100)
                
                Text("Didn't receive a reset email?")
                    .font(.footnote)
                    .foregroundColor(.white)
                
                Button(action: {}){
                    Text(" Click here to resend.").bold()
                        .font(.footnote)
                        .foregroundColor(.white)
                }
            }
        }
    }
}


struct AuthView_Previews : PreviewProvider {
    static var previews: some View {
        AuthView()
            .environmentObject(SessionStore())
    }
}




