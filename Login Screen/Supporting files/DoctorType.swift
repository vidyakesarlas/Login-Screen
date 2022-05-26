//
//  DoctorType.swift
//  Login Screen
//
//  Created by vidya.k on 26/05/22.
//

import Foundation

enum DoctorType{
    
    case dental
    case dermatology
    case digestive
    case ent
    case eyeSpecialist
    case childSpecialist
    case gynaecology
    case homeopathy
    case orthopaedician
    case psychiatry
    case sexSpecialist
    case generalPhysician
    case none
    
    
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .dental: return "Dentist"
        case .dermatology: return "Skin & Hair"
        case .digestive: return "Digestive Issues"
        case .ent: return "Ear Nose Throat"
        case .eyeSpecialist: return "Eye Specialist"
        case .childSpecialist: return "Child Specialist"
        case .gynaecology: return "Women's Health"
        case .homeopathy: return "Homeopathy"
        case .orthopaedician: return "Bone and Joints"
        case .psychiatry: return "Mental Wellness"
        case .sexSpecialist: return "Sex Specialist"
        case .generalPhysician: return "General Physician"
        default: return ""
        }
      }
}
