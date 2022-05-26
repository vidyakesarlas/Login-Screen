//
//  Doctors.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import Foundation

import UserNotifications

class Doctors{
    
    var image: String = ""
    var name: String = ""
    var yrs: String = ""
    var designation: String = ""
    var address: String = ""
    var fees: String = ""
    var appmtBooked: Bool = false
    
    init(image: String, name: String, yrs: String, designation: String, address: String, fees: String){
        self.image = image
        self.name = name
        self.yrs = yrs
        self.designation = designation
        self.address = address
        self.fees = fees
    }
    
    func notifCall(titleSent: String, bodySent: String, dateBooked: Date){
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        //step2: create notification content
        let content = UNMutableNotificationContent()
        content.title = titleSent
        content.body = bodySent
        
        //step 3: create notification trigger
        let date = dateBooked.addingTimeInterval(7)
        let calendar = NSCalendar.autoupdatingCurrent
        let newDate = calendar.date(byAdding: .minute, value: -10, to: date) ?? date
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: newDate)
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
