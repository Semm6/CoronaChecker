//
//  Person.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 14/12/2020.
//

import UIKit

//-----class profile-----//
//email and password are capped

class Profile {
    
    var firstname: String
    var lastname: String
    var email: String
    var password: String
    
    init(firstname:String, lastname:String, email:String, password:String) {
        
        self.firstname = Profile.format(text: firstname)
        self.lastname = Profile.format(text: lastname)
        self.email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        self.password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
    
    //dont need to capilize names this function does it for you
    private static func format(text:String) -> String {
        let result = text.trimmingCharacters(in: .whitespacesAndNewlines).capitalized
        
        
        return result
    }
}

//let userprofile1 = Profile(firstname: firstNameTextField.text!, lastname: lastNameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)


//-----Reminders-----//

//trimming charachters and whitespacesandnewlines makes sure there are no whitespaces (puts i back together)
