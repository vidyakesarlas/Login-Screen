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
        case .dermatology: return "Skin&Hair"
        case .digestive: return "DigestiveIssues"
        case .ent: return "EarNoseThroat"
        case .eyeSpecialist: return "EyeSpecialist"
        case .childSpecialist: return "ChildSpecialist"
        case .gynaecology: return "Women'sHealth"
        case .homeopathy: return "Homeopathy"
        case .orthopaedician: return "BoneandJoints"
        case .psychiatry: return "MentalWellness"
        case .sexSpecialist: return "SexSpecialist"
        case .generalPhysician: return "GeneralPhysician"
        default: return ""
        }
      }
}
