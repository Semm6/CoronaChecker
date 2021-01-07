//
//  CurrrentUser.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 06/01/2021.
//



import UIKit

struct CurrentUser {
    
    let name: String
    let email: String
    let gender: String
    
    init(naam: String, email: String, geslacht: String) {
        self.name = naam
        self.email = email
        self.gender = geslacht
    }
}

