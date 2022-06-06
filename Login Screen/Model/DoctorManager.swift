//
//  DoctorManager.swift
//  ParsePlist
//
//  Created by vidya.k on 25/05/22.
//  Copyright © 2022 YOUNGSIC KIM. All rights reserved.
//

import Foundation

class DoctorManager{
    var doctors: [Doctors] = []
    func getDoctorObject(path: URL) -> [Doctors]{
        var name: String = ""
        var yrs: String = ""
        var designation: String = ""
        var address: String = ""
        var fees: String = ""
        var appmtBooked: Bool = false
        var image: String = ""
        
        if let docArray = NSMutableArray(contentsOf: path){
            
            for (doc) in docArray
            {
                name = (doc as AnyObject).object(forKey: "name") as! String
                yrs = (doc as AnyObject).object(forKey: "yrs") as! String
                designation = ( doc as AnyObject).object(forKey: "designation") as! String
                fees = ( doc as AnyObject).object(forKey: "fees") as! String
                address = ( doc as AnyObject).object(forKey: "address") as! String
                image = (doc as AnyObject).object(forKey: "image") as! String
                appmtBooked = (doc as AnyObject).object(forKey: "appmtBooked") as! Bool
                
               // appmtBooked = (doc as AnyObject).object(forKey: "appmtBooked") as! String
                print("hi")
                let doc1 = Doctors(image: image, name:name, yrs:  yrs, designation:  designation, address:  address, fees: fees, appmtBooked: appmtBooked)
                doctors.append(doc1)
            }
        }
        return doctors
    }
    
    func writeDoctorObject(path: URL, data: Data){
    
               do {

                   if try data.write(to: path, options: .completeFileProtection) != nil {
                       
                       print("data succesfully written")
                    
                   }

               } catch {

                   print("File write failed")

               }

    }
    
    
}
