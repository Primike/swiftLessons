//
//  AppDelegate.swift
//  UIKitLessons
//
//  Created by Prince Avecillas on 6/8/24.
//

import UIKit

// responder is for app response to gestures. all uiviews conform to this
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.rootViewController = UIKitViewVC()
        return true
    }
}
