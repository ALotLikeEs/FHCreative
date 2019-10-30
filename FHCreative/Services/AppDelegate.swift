//
//  AppDelegate.swift
//  FHCreative
//
//  Created by Admin on 22/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseCore
import FirebaseFirestore

var db: Firestore!
var profileStatus = 0
let defaults = UserDefaults.standard

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance()?.delegate = self as? GIDSignInDelegate
        
        // [START setup]
             let settings = FirestoreSettings()
             Firestore.firestore().settings = settings
             // [END setup]
             db = Firestore.firestore()
        
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

