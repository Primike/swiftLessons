//
//  UIApplication.swift
//  UIKitLessons
//
//  Created by Prince Avecillas on 6/8/24.
//

import Foundation
import UIKit

//@main
class UIApplicationAndDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let application = UIApplication.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBlue
        window?.rootViewController = UIViewController()
        applicationDetails()
        return true
    }

    func applicationDetails() {
        print(application.applicationState == .inactive)
        print(application.supportsMultipleScenes)
        print(application.connectedScenes)
    }
}

// Register for remote notifications
extension UIApplicationAndDelegate {
    func registerRemoteNotifications() {
        application.registerForRemoteNotifications()
        print(application.isRegisteredForRemoteNotifications)
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: any Error) {
        print(error)
    }
}

extension UIApplicationAndDelegate {
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("background")
    }
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminate")
    }
}
