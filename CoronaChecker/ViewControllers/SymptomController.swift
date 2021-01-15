//
//  SymptomController.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 10/12/2020.
//

import UIKit


class SymptomController: UIViewController {
    
    //? is for optional. So it doesn't crash
    var selectedSymptom: Symptom?
    var selectedAdvice: Advies1?
    
    
        //switches outlets
        @IBOutlet weak var misselijkheid: UISwitch!
        @IBOutlet weak var verkoudheid: UISwitch!
        @IBOutlet weak var kortademigheid: UISwitch!
        @IBOutlet weak var koorts: UISwitch!
        @IBOutlet weak var keelpijn: UISwitch!
        @IBOutlet weak var hoofdpijn: UISwitch!
        @IBOutlet weak var drogehoest: UISwitch!
        @IBOutlet weak var diarree: UISwitch!
        @IBOutlet weak var spraakaangetast: UISwitch!
        @IBOutlet weak var smaakaangetast: UISwitch!
        @IBOutlet weak var buttonPressed: UIButton!
    
    
    
    
            override func viewDidLoad() {
                super.viewDidLoad()
            }
    

        @IBAction private func buttonClicked(_ sender: UIButton) {
            
            let symptomSliders: [UISwitch] = [misselijkheid, verkoudheid, kortademigheid, koorts, keelpijn, hoofdpijn, drogehoest, diarree, spraakaangetast, smaakaangetast]
        
            selectedAdvice = showAdvice().getAdvice(symptomSliders: symptomSliders)
            
            //show the advice with segue
            performSegue(withIdentifier: "showAdvice", sender: self)
        }
    
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            
            if(segue.identifier == "showAdvice"){
                if let targetViewController = segue.destination as? AdviceController{
                    targetViewController.selectedAdvice = self.selectedAdvice
                    
                    }
                }
            
            }
    
        
}
 

