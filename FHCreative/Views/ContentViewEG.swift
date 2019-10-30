//
//  SwiftUIViewEg.swift
//  
//
//  Created by Admin on 25/10/2019.
//

import SwiftUI

//struct DetailViewB: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    @State var fullDissmiss:Bool = false
//    var body: some View {
//        SGNavigationChildsView(fullDissmiss: self.fullDissmiss){
//            VStack {
//                Text("This is Detail View B.")
//
//                Button(action: { self.presentationMode.wrappedValue.dismiss() } )
//                { Text("Pop to Detail View A.") }
//
//                Button(action: {
//                    self.fullDissmiss = true
//                } )
//                { Text("Pop two levels to Master View with SGGoToRoot.") }
//            }
//        }
//    }
//}
//
//struct DetailViewA: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    @State var fullDissmiss:Bool = false
//    var body: some View {
//        SGNavigationChildsView(fullDissmiss: self.fullDissmiss){
//            VStack {
//                Text("This is Detail View A.")
//
//                NavigationLink(destination: DetailViewB() )
//                { Text("Push to Detail View B.") }
//
//                Button(action: { self.presentationMode.wrappedValue.dismiss() } )
//                { Text("Pop one level to Master.") }
//
//                Button(action: { self.fullDissmiss = true } )
//                { Text("Pop one level to Master with SGGoToRoot.") }
//            }
//        }
//    }
//}
//
//struct MasterView: View {
//    var body: some View {
//        VStack {
//            Text("This is Master View.")
//            NavigationLink(destination: DetailViewA() )
//            { Text("Push to Detail View A.") }
//        }
//    }
//}
//
//struct ContentViewEG: View {
//
//    var body: some View {
//        SGRootNavigationView{
//            MasterView()
//        }
//    }
//}
//#if DEBUG
//struct ContentViewEG_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentViewEG()
//    }
//}
//#endif
//
//struct SGRootNavigationView<Content>: View where Content: View {
//    let cancellable = NotificationCenter.default.publisher(for: Notification.Name("SGGoToRoot"), object: nil)
//
//    let content: () -> Content
//
//    init(@ViewBuilder content: @escaping () -> Content) {
//        self.content = content
//    }
//
//    @State var goToRoot:Bool = false
//
//    var body: some View {
//        return
//            Group{
//            if goToRoot == false{
//                NavigationView {
//                content()
//                }
//            }else{
//                NavigationView {
//                content()
//                }
//            }
//            }.onReceive(cancellable, perform: {_ in
//                DispatchQueue.main.async {
//                    self.goToRoot.toggle()
//                }
//            })
//    }
//}
//
//struct SGNavigationChildsView<Content>: View where Content: View {
//    let notification = Notification(name: Notification.Name("SGGoToRoot"))
//
//    var fullDissmiss:Bool{
//        get{ return false }
//        set{ if newValue {self.goToRoot()} }
//    }
//
//    let content: () -> Content
//
//    init(fullDissmiss:Bool, @ViewBuilder content: @escaping () -> Content) {
//        self.content = content
//        self.fullDissmiss = fullDissmiss
//    }
//
//    var body: some View {
//        return Group{
//            content()
//        }
//    }
//
//    func goToRoot(){
//        NotificationCenter.default.post(self.notification)
//    }
//}


struct AddButton<Destination : View, Text : View>: View {
    
    var destination:  Destination
    var text : Text
    
    var body: some View {
        NavigationLink(destination: self.destination) { text}
    }
}

struct companyLink : View { var body : some View { Text("company").padding(12).background(Color("FHCoral")) } }
struct industryLink : View { var body : some View { Text("industry").padding(12).background(Color("FHCoral")) } }
struct skillsLink : View { var body : some View { Text("skills").padding(12).background(Color("FHCoral")) } }
struct profileLink : View { var body : some View { Text("profile").padding(12).background(Color("FHCoral")) } }


import SwiftUI

struct Master: View {
    @State var selection: Int? = nil
    @State var name : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("This is the navigation view").font(.title).foregroundColor(Color("FHDusk"))
                //
            }
            .navigationBarItems(trailing:
                    HStack {
                        AddButton(destination: Profile(), text: profileLink());
                        AddButton(destination: Companys(), text: companyLink());
                        AddButton(destination: Industry(), text: industryLink());
                        AddButton(destination: Skills(), text: skillsLink());
                    }.frame(height:50))
            
            //.navigationBarItems(trailing: HStack { AddButton(destination: Companys()); AddButton(destination: Industry())})
        }
    }
}

struct Profile: View {
    
    @Environment(\.presentationMode) var presentation
    @State var name : String = ""
    
    var body: some View {
        Group {
            Text("Profile")
            TextField("Name", text: $name)
            Button("pop back") {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

struct Companys: View {
    
    @Environment(\.presentationMode) var presentation
    @State var name : String = ""
    
    var body: some View {
        Group {
            Text("Company")
            TextField("Name", text: $name)
            Button("pop back") {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

struct Industry: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Group {
            Text("Industry")
            Button("pop back") {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

struct Skills: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Group {
            Text("Skills")
            Button("pop back") {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

#if DEBUG
struct Master_Previews: PreviewProvider {
    static var previews: some View {
        Master()
    }
}
#endif
