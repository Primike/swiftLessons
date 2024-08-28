//
//  SwiftLessonsApp.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI
import Firebase

@main
struct SwiftLessonsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SwiftDemoView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
