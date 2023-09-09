//
//  SwiftAndFirebaseIntermediateLevelApp.swift
//  SwiftAndFirebaseIntermediateLevel
//
//  Created by Gokhan Kaya on 6.09.2023.
//

import SwiftUI
import Firebase

@main
struct SwiftAndFirebaseIntermediateLevelApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? =
        nil) -> Bool {
            FirebaseApp.configure ()
        print("configured firebase")

        return true
    }
}
