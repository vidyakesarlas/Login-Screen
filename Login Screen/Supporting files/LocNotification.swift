//
//  LocNotification.swift
//  Login Screen
//
//  Created by vidya.k on 23/05/22.
//

import Foundation
import UserNotifications

struct LocNotification{
    
    func notifCall(titleSent: String, bodySent: String, dateBooked: Date){
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
    
        //step2: create notification content
        
        let content = UNMutableNotificationContent()
        content.title = titleSent
        content.body = bodySent

        //step 3: create notification trigger
        let date = dateBooked.addingTimeInterval(-600)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        
        //step4: create the request
        let uuidString = UUID().uuidString
        
       let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        
        //step 5: register with notification center
        center.add(request) { error in
            //check the error parameter and handle any errors
            
            
        }
    }
    
    
  
}
