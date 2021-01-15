//
//  showAdvice.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 12/01/2021.
//

import UIKit

//class showadvice with function getAdvice

public class showAdvice {
    
    
    var selectedSymptom: Symptom?
    var selectedAdvice: Advies1?
    
    
    func getAdvice(symptomSliders: [UISwitch]) -> Advies1 {
    
        let symptoms: [Symptom] = [
            
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
        
        let advies: [Advies1] = [
            
            //index 0
            Advies1(advies: "Denk aan de 1,5 meter en vermijd zoveel mogelijk drukte. Verder is het belangrijk dat u altijd een mondkapje draagt, zodat er niet meer mensen besmet worden.", quarantaine: "Ons advies luid dat u niet in quarantaine hoeft."),
            
            //index 1
            Advies1(advies: "Houdt uw gezondheid in de gaten. Als uw klachten niet afnemen, plan dan een afspraak in voor een (snel)test. Ondertussen vermijdt zoveel mogelijk drukte en houdt 1,5 meter afstand.", quarantaine: "Ons advies luid dat u niet in quarantaine hoeft."),
            
            //index 2
            Advies1(advies: " Het is belangrijk dat u een test laat afnemen. Plan deze meteen in! Houd goed afstand en vermijd zoveel mogelijk contact.", quarantaine: "Ons advies luid om thuis te blijven tot u de uitslag van de test heeft ontvagen."),
            
            //index 3
            Advies1(advies: "Het lijkt erop dat u het coronavirus heeft opgelopen. Laat u onmiddellijk testen, dit kan via de website van het RIVM. Houd afstand met uw gezinsleden en huisgenoten. Blijf in uw woning.", quarantaine: "Ons advies luidt om 10 dagen in quarantaine te gaan.")
        ]
        

    
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
        
            selectedAdvice = advies[adviceIndex]
            return selectedAdvice!
    }
}


