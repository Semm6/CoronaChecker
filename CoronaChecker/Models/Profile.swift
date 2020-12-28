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
    
    var name: String
    var lastname: String
    var age: Int
    private var email: String
    private var password: String
    
    init(name:String, backname:String, age:Int, email:String, password:String) {
        self.name = name
        self.lastname = backname
        self.age = age
        self.email = email
        self.password = password
    }
}

