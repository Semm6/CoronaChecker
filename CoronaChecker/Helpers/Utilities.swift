//
//  Utilities.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 17/12/2020.
//

import UIKit

class Utilities {
    
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
        
        
    }
    
}
