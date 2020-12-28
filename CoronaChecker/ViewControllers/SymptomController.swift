//
//  SymptomController.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 10/12/2020.
//

import UIKit


class SymptomController: UIViewController {
    
    //? is for optional. So it doesn't crash
    var selectedSymptom: Symptom1?
    
    //array (depend on witch switch you switch you get a different advice)
    //these are all objects in arrays
    var symptoms: [Symptom1] = [
        
          Symptom1(naam: "Misselijkheid", advies: "Als u last heeft van misselijkheid dan hoeft u geen arts te raadplegen. U moet gewoon binnen blijven en zorgen dat u niemand kan besmetten. Als u 24 uur lang geen klachten meer heeft bent u weer gezond en dan mag u weer normale dingen doen ", quarantaine: "Ja"),
        
          Symptom1(naam: "Verkoudheid", advies: "Als u alleen last heeft van verkoudheid klachten dan mag u thuisblijven tot de klachten minimaal 24 uur weg zijn. Als u daarnaast nog klachten heeft wordt het aangeraden om een arts te raadplegen", quarantaine: "Nee"),
        
          Symptom1(naam: "Kortademigheid", advies: "Als u last heeft van kortademigheid dan is het van belang dat u een arts raadpleegt. Kortademigheid is namelijk een zwaar symptoom. En gaat vaak gepaard met nog een ander symptoom.", quarantaine: "Ja"),
        
          Symptom1(naam: "Koorts", advies: "Als u langer dan 3 dagen koorts heeft boven de 38 graden dan is het aangeraden om een arts te raadplegen. U ouder dan 70 bent of last heeft van een chronische ziekte dan moet u meteen een arts raadplegen.", quarantaine: "Nee"),
        
          Symptom1(naam: "Keelpijn", advies: "Keelpijn is een licht symptoom die minder vaak voorkomt. U kan zich voor keelpijn laten testen als u zich daar beter bij voelt, maar u kunt ook thuisblijven tot de keelpijn weg is. Als u naast keelpijn nog een ander symptoom heeft dan is het aangeraden om alsnog een test te doen", quarantaine: "Ja"),
        
          Symptom1(naam: "Hoofdpijn", advies: "Als u last heeft van hoofdpijn wil dat niet zeggen dat u Corona heeft. Zo gaat hoofdpijn ook samen met stress en normale griep. Als u meer klachten heeft dan alleen hoofdpijn is het zeker aangeraden om uw arts te raadplegen. Mocht u alleen last hebben van hoofdpijn is het advies om binnen te blijven totdat u 24 uur klachtenvrij bent.", quarantaine: "Nee"),
        
          Symptom1(naam: "Droge hoest", advies: "Een kuchje betekent niet meteen Corona. Met droge hoest wordt bedoeld dat je niet hoest om de luchtweg vrij te maken, omdat er iets zit, maar omdat er iets irriteert. Als u langer dan een paar dagen last hebt van droge hoest dan is het zeker aangeraden om een arts te raadplegen. Als u langer 24 uur geen klachten meer heeft bent u volgens het RIVM veilig en mag u weer dingen doen.", quarantaine: "Nee"),
        
          Symptom1(naam: "Diarree", advies: "Als u alleen last heeft van diarree dan mag u gewoon thuisblijven, maar diarree gaat vaak gepaard met andere symptomen, als dat zo is dan is het verstandig om een arts te raadplegen. ", quarantaine: "Ja"),
        
          Symptom1(naam: "Spraak aangetast", advies: "Als u last heeft van een aangetast spraakvermogen dan moet u zo snel mogelijk een arts raadplegen aangezien uw brein wordt aangetast door corona en dat kan uiteindelijk gevolgen hebben.", quarantaine: "Ja"),
        
          Symptom1(naam: "Smaak aangetast", advies: "Als u last heeft van een aangetast smaak- of reukvermogen dan moet u zo snel mogelijk een arts raadplegen aangezien uw brein wordt aangetast door corona en dat kan uiteindelijk gevolgen hebben.", quarantaine: "Nee"),
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
    
            override func viewDidLoad() {
                super.viewDidLoad()
                
                
            misselijkheid.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            verkoudheid.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            kortademigheid.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            koorts.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            keelpijn.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            hoofdpijn.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            drogehoest.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            diarree.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            spraakaangetast.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            smaakaangetast.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        }
    
        
        //switches changed
        @objc func switchChanged(sender: UISwitch){
            
            //show advice from array index
            if(misselijkheid.isOn){
                self.selectedSymptom = symptoms[0]
            }else if verkoudheid.isOn {
                self.selectedSymptom = symptoms[1]
            }else if kortademigheid.isOn {
                self.selectedSymptom = symptoms[2]
            }else if koorts.isOn {
                self.selectedSymptom = symptoms[3]
            }else if keelpijn.isOn {
                self.selectedSymptom = symptoms[4]
            }else if hoofdpijn.isOn {
                self.selectedSymptom = symptoms[5]
            }else if drogehoest.isOn {
                self.selectedSymptom = symptoms[6]
            }else if diarree.isOn {
                self.selectedSymptom = symptoms[7]
            }else if spraakaangetast.isOn {
                self.selectedSymptom = symptoms[8]
            }else if smaakaangetast.isOn {
                self.selectedSymptom = symptoms[9]
            }
            
            //show the advice with segue
            performSegue(withIdentifier: "showAdvice", sender: self)
           
        }
    
    
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            
            if(segue.identifier == "showAdvice"){
                if let targetViewController = segue.destination as? AdviceController{
                    targetViewController.selectedSymptom = self.selectedSymptom
                    
                }
                
            }
        }
  }




