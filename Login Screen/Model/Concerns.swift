//
//  Concerns.swift
//  Login Screen
//
//  Created by vidya.k on 19/04/22.
//

import Foundation

class Concerns{
    var image: String = ""
    var name: DoctorType = .none
    
    init(image: String, name: DoctorType){
        self.image = image
        self.name = name
    }
}

