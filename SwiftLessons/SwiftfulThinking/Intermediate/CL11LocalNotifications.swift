//
//  CL11LocalNotifications.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI
import UserNotifications
import CoreLocation

class CL11NotificationManager {
    static let shared = CL11NotificationManager()
    
    private init() {}
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "First notification"
        content.subtitle = "Chungus"
        content.sound = .default
        content.badge = 1
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 14
//        dateComponents.minute = 56
//        dateComponents.weekday = 2
//        let calendar = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let location = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: location)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
struct CL11LocalNotifications: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permission") {
                CL11NotificationManager.shared.requestAuthorization()
            }
            Button("Schedule Notification") {
                CL11NotificationManager.shared.scheduleNotification()
            }
            Button("Cancel Notification") {
                CL11NotificationManager.shared.cancelNotification()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct CL11LocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        CL11LocalNotifications()
    }
}
