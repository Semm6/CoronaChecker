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
    
    
    
    //array (depend on witch switch you switch you get a different advice)
    //these are all objects in arrays
    //constructor overloading
    var symptoms: [Symptom] = [
        
          Symptom(naam: "Misselijkheid", danger: 1),
        
          Symptom(naam: "Verkoudheid", danger: 0),
        
          Symptom(naam: "Kortademigheid", danger: 2),
        
          Symptom(naam: "Koorts", danger: 2),
        
          Symptom(naam: "Keelpijn", danger: 1),
        
          Symptom(naam: "Hoofdpijn", danger: 0),
        
          Symptom(naam: "Droge hoest", danger: 1),
        
          Symptom(naam: "Diarree", danger: 2),
        
          Symptom(naam: "Spraak aangetast", danger: 3),
        
          Symptom(naam: "Smaak aangetast", danger: 3)
    ]
    
    //array for advices
    var advies: [Advies1] = [
        
        //index 0
        Advies1(advies: "Denk aan de 1,5 meter en vermijd zoveel mogelijk drukte. Verder is het belangrijk dat u altijd een mondkapje draagt, zodat er niet meer mensen besmet worden.", quarantaine: "Ons advies luid dat u niet in quarantaine hoeft."),
        
        //index 1
        Advies1(advies: "Houdt uw gezondheid in de gaten. Als uw klachten niet afnemen, plan dan een afspraak in voor een (snel)test. Ondertussen vermijdt zoveel mogelijk drukte en houdt 1,5 meter afstand.", quarantaine: "Ons advies luid dat u niet in quarantaine hoeft."),
        
        //index 2
        Advies1(advies: " Het is belangrijk dat u een test laat afnemen. Plan deze meteen in! Houd goed afstand en vermijd zoveel mogelijk contact.", quarantaine: "Ons advies luid om thuis te blijven tot u de uitslag van de test heeft ontvagen."),
        
        //index 3
        Advies1(advies: "Het lijkt erop dat u het coronavirus heeft opgelopen. Laat u onmiddellijk testen, dit kan via de website van het RIVM. Houd afstand met uw gezinsleden en huisgenoten. Blijf in uw woning.", quarantaine: "Ons advies luidt om 10 dagen in quarantaine te gaan.")
    ]
    
    
    
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
            
            //var because they change value
            var adviceIndex = 0
            var newAdviceIndex = 0
            
            var index = 0
            while index < symptomSliders.count {
                if (symptomSliders[index].isOn) {
                    newAdviceIndex = symptoms[index].danger
                    if (newAdviceIndex > adviceIndex) {
                        adviceIndex = newAdviceIndex
                    }
                    symptomSliders[index].setOn(false, animated: false)
                }
                index = index + 1
            }

            self.selectedAdvice = advies[adviceIndex]

            
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
 

