//
//  Symptom.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 11/12/2020.
//

import UIKit


//-----class symptom-----//

public class Symptom {
    
    var naam: String
    var danger: Int
    
    init(naam:String, danger:Int) {
        self.naam = naam
        self.danger = danger
    }
}
