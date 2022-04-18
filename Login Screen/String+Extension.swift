//
//  String+Extension.swift
//  Login Screen
//
//  Created by vidya.k on 13/04/22.
//

import Foundation



extension String {
    var isValidEmail: Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }
    
    var isValidPassword: Bool{
        let regularExpressionForPassword =
        // At least 8 characters
        #"(?=.{8,})"# +
        
        // At least one capital letter
        #"(?=.*[A-Z])"# +
        
        // At least one lowercase letter
        #"(?=.*[a-z])"# +
        
        // At least one digit
        #"(?=.*\d)"# +
        
        // At least one special character
        #"(?=.*[ !$%&?._-])"#
        
        
        let testPassword = NSPredicate(format: "SELF MATCHES %@", regularExpressionForPassword)
        return testPassword.evaluate(with: self)
    }
    
}
