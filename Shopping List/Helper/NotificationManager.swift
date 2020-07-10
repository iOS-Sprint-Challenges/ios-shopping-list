//
//  NotificationManager.swift
//  Shopping List
//
//  Created by FGT MAC on 7/7/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

struct NotificationManager {
    
    private let notificationCenter = UNUserNotificationCenter.current()
    
    func scheduleNotification(title: String, body: String){
         let content = UNMutableNotificationContent()
         let userActions = "User Actions"
         
         content.title = "Delivery for \(title)"
         content.body = "Your shopping items will be deliver to \(body) in 15 minutes"
         content.sound = UNNotificationSound.default
         content.badge = 1
         content.categoryIdentifier = userActions
         
         let trigger = UNTimeIntervalNotificationTrigger (timeInterval: (1*60), repeats: false)
         let identifier = UUID().uuidString
         
         let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
         
         notificationCenter.add(request) { (error) in
             if let error = error{
                 print(error)
             }else{
                 print("Notification scheduled!")
             }
         }
         
         let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options:[] )
         let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
         
         let category = UNNotificationCategory(identifier: userActions, actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
         
         notificationCenter.setNotificationCategories([category])
     }
    
    func requestPermission() {
            notificationCenter.requestAuthorization(options: [.alert,.badge,.sound]) { (didAllow, error) in
                
                if !didAllow{
                    print("User declined")
                }
                
            }
    }
    
}
