//
//  LogInController.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 10/12/2020.
//

import UIKit
import FirebaseAuth

class LogInController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        setUpElements()
    }
    
    //hide the error label
    func setUpElements() {
        
        errorLabel.alpha = 0
    }
    
    @IBAction private func loginTapped(_ sender: Any) {
    
        //create cleaned version of the textfields
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                
                //could'nt sign in
                self.errorLabel.text = error!.localizedDescription
                //this shows the error
                self.errorLabel.alpha = 1
            }
            else {
                
                let SymptomController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.SymptomController) as? SymptomController
                
                self.view.window?.rootViewController = SymptomController
                self.view.window?.makeKeyAndVisible()
                
                
                
            }
        }
    }

}
    
    
    
    
  



