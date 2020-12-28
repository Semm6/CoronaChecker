//
//  Register.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 14/12/2020.
//

import UIKit
import FirebaseAuth
import Firebase


class RegisterController: UIViewController {
    
    //outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    //hide error labels
    func setUpElements() {
        
        errorLabel.alpha = 0
    }
    
    
    //checks the fields and validate if the data is correct. if not it will give an error message in return
    func validateFields() -> String? {
        
        //check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "please fill in all fields."
        }
        
        //check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password isn't secure enough
            return "please make sure your password is secure enough"
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            
            //there is something wrong with the fields show error message
            showError(error!)
        }
        else {
            
            //cleaned version of the data
            let first_Name = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let last_Name = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
                //create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            
                //check for errors (if error is not equal to nill)
                if err != nil {
                    
                    //there was an error creating the user
                    self.showError("Error creating user")
                }
                else {

                    //user is created succesfully (store first and lastname)
                    let db = Firestore.firestore()
                    
                    db.collection("users").document(result!.user.uid).setData([
                                           "first_name": first_Name,
                                           "last_name": last_Name
                                       ]) { (error) in
                        
                        if error != nil {
                            //show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    //transition to symptom screen
                    self.transitionToHome()
                    
                }
                
                
            }
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let SymptomController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.SymptomController) as? SymptomController
        
        view.window?.rootViewController = SymptomController
        view.window?.makeKeyAndVisible()
    }
}

