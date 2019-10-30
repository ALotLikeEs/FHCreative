import SwiftUI

struct AppTabView : View {
    
    @State var selection = 1
    
    var body : some View {
        
        TabView (selection: $selection) {
            //View public profiles of people your connected to
            landingView()
                .tabItem {
                    Image(systemName: "house")
            }.tag(0)
            //View public profiles of people your connected to
            dashboardView()
                .tabItem {
                    Image(systemName: "speedometer")
            }.tag(1)
            addPostView()
                .tabItem {
                    Image(systemName: "plus.circle")
            }.tag(2)
            
            ChatMessageView()
                .tabItem {
                    Image(systemName: "message")
            }.tag(3)
            //View users private profile - should link to profiles page
            myPageView()
                .tabItem {
                    Image(systemName: "person")
            }.tag(4)
        }.background(Color("FHDusk"))
    }
}

struct landingView: View {
    
    @EnvironmentObject var session: SessionStore
    
    @State var profileIsEmpty = true
    
    func signOut() {
        print("\(String(describing: session.signOut))")
    }
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Background(startColor: Color("FHBabyBlue"), endColor: Color("FHCoral"))
                
                VStack {
                    
                    ZStack {
                        
                        Image("OnboardingFive").resizable().aspectRatio(contentMode: .fill)
                        VStack {
                            
                            Text("\(session.profile?.firstname ?? "Hey there"),\nwelcome to").font(.title).multilineTextAlignment(.center).foregroundColor(.gray).padding(24)
                            
                            FHIconType(imageType: "gray").resizable().aspectRatio(contentMode: .fit).frame(width:100, height: 100)
                        }.frame(width:300)
                    }
                    
                    Text("Get work down,\nget paid").font(.body).multilineTextAlignment(.center).frame(height:nil).lineLimit(2).foregroundColor(.white).padding(24)
                    
                }
            }
        }
    }
}

struct dashboardView : View {
    var body : some View {
        VStack{
            Text("Dashboard")
        }
    }
}

struct addPostView : View {
    
    @State var showingPicker = false
    @State var enableButton = false
    @State var image : Image? = nil
    @State var numberPlate : String = ""
    @State var caption : String = ""
    
    func isValidated () -> Bool {
        return numberPlate.isEmpty || image == nil || numberPlate.count < 7
    }
    
    var body: some View {
        
        VStack {
            
            Text("Post job").font(.title)
            
            image?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            CustomTextField(systemImageName: "", textLabel: "Caption", inputText: $numberPlate)
            
            Button(action:{
                self.showingPicker = true
            }){
                Image(systemName: "camera")
            }
            
            Button(action: {}) {
                BlueButton(buttonLabel: "Post", condition: isValidated())
            }.disabled(isValidated())

            
        }.padding().sheet(isPresented: $showingPicker, onDismiss: {
            //Do what needs to be done with image
            if (ImagePicker.shared.image != nil && self.numberPlate != "") {
                
            }
            
        }, content: {
            ImagePicker.shared.view
        })
            .onReceive(ImagePicker.shared.$image){
                image in
                //Get's called wth the image is picked,.. when picker leaves the screen
                self.image = image
        }
    }
}

// let's create a structure that will represent each message in chat
struct ChatMessage : Hashable {
    var message: String
    var avatar: String
    var color: Color
    // isMe will be true if We sent the message
    var isMe: Bool = false
}

struct ChatMessageView : View {
    
     // @State here is necessary to make the composedMessage variable accessible from different views
    @State var composedMessage: String = ""
    
    @EnvironmentObject var chatController: ChatController
    
    var body: some View {
      
        // the VStack is a vertical stack where we place all our substacks like the List and the TextField
        VStack {
            // I've removed the text line from here and replaced it with a list
            // List is the way you should create any list in SwiftUI
            List {
                // we have several messages so we use the For Loop
                ForEach(chatController.messages, id: \.self) { msg in
                    ChatRow(chatMessage: msg)
                }
            }
            
            // TextField are aligned with the Send Button in the same line so we put them in HStack
            HStack {
                // this textField generates the value for the composedMessage @State var
                TextField("Message...", text: $composedMessage).frame(minHeight: CGFloat(30))
                // the button triggers the sendMessage() function written in the end of current View
                Button(action: sendMessage) {
                    Text("Send")
                }
            }.frame(minHeight: CGFloat(50)).padding()
            // that's the height of the HStack
        }
    }
    func sendMessage() {
        chatController.sendMessage(ChatMessage(message: composedMessage, avatar: "C", color: .green, isMe: true))
        composedMessage = ""
    }
}

// ChatRow will be a view similar to a Cell in standard Swift
struct ChatRow : View {
    // we will need to access and represent the chatMessages here
    var chatMessage: ChatMessage
    // body - is the body of the view, just like the body of the first view we created when opened the project
    var body: some View {
        // HStack - is a horizontal stack. We let the SwiftUI know that we need to place
        // all the following contents horizontally one after another
        Group {
            if !chatMessage.isMe {
                HStack {
                    Group {
                        Text(chatMessage.avatar)
                        Text(chatMessage.message)
                            .bold()
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(chatMessage.color)
                            .cornerRadius(10)
                    }
                }
            } else {
                HStack {
                    Group {
                        Spacer()
                        Text(chatMessage.message)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(chatMessage.color)
                        .cornerRadius(10)
                        Text(chatMessage.avatar)
                    }
                }
            }
        }

    }
}

struct myPageView : View {
    
    @EnvironmentObject var session: SessionStore
    
    func signOut() {
        print("\(String(describing: session.signOut))")
    }
    
    var body : some View {
        HStack {
            Button(action: signOut){
                OutlineButton(buttonLabel: "Sign out")
            }.padding(12)
            
            Button (action: {
                print("Hey")
            } ){
                NavigationLink(destination: ProfileView()){
                    Text("Profile")
                }
            }
        }
    }
}

struct AppView: View {
    var body: some View {
        NavigationView {
            AppTabView(selection: 0)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(selection:0)
    }
}
