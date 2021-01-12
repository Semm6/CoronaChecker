//
//  AdviceViewController.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 09/12/2020.
//

import UIKit

    class AdviceController: UIViewController {

        
        var selectedSymptom: Symptom?
        var selectedAdvice: Advies1?
        
        
        
        
        @IBOutlet weak var Advies: UILabel!
        @IBOutlet weak var Quarantaine: UILabel!
        
    
                override func viewDidLoad() {
                super.viewDidLoad()
                    
                    
                    if let selectedAdvice = selectedAdvice {
                        Advies.text = selectedAdvice.advies
                        Quarantaine.text = selectedAdvice.quarantaine
                    }
                    
                    
                    
                    
                 
    }
}

    
