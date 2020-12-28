//
//  AdviceViewController.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 09/12/2020.
//

import UIKit

    class AdviceController: UIViewController {

        //selectedSymptom Optional
        var selectedSymptom: Symptom1?
        
        
        
        @IBOutlet weak var Naam: UILabel!
        @IBOutlet weak var Advies: UILabel!
        @IBOutlet weak var Quarantaine: UILabel!
        
    
                override func viewDidLoad() {
                super.viewDidLoad()
                    

                    //if let essentially saves you from a crash. If the variable doesn't have a value when it hits the lines where you use the variables, it will skip over those lines, saving you from the crash.
                    
                    if let selectedSymptom = selectedSymptom {
                        
                        Naam.text = selectedSymptom.naam
                        Advies.text = selectedSymptom.advies
                        Quarantaine.text = selectedSymptom.quarantaine
                    }
                    
                    
                 
    }
}

    
