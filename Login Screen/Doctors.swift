//
//  Doctors.swift
//  Login Screen
//
//  Created by vidya.k on 04/05/22.
//

import Foundation


class Doctors{
    
    var image: String = ""
    var name: String = ""
    var yrs: String = ""
    var designation: String = ""
    var address: String = ""
    var fees: String = ""
    
    
    init(image: String, name: String, yrs: String, designation: String, address: String, fees: String){
        self.image = image
        self.name = name
        self.yrs = yrs
        self.designation = designation
        self.address = address
        self.fees = fees
    }
    
    
}
