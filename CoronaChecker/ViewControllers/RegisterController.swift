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
    @IBOutlet  weak var firstNameTextField: UITextField!
    @IBOutlet  weak var lastNameTextField: UITextField!
    @IBOutlet  weak var emailTextField: UITextField!
    @IBOutlet  weak var passwordTextField: UITextField!
    @IBOutlet  weak var genderTextField: UITextField!
    @IBOutlet  weak var birthdateTextField: UITextField!
    @IBOutlet  weak var signUpButton: UIButton!
    @IBOutlet  weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //function setupelements
        setUpElements()
        
        //func datepicker (line 148)
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = UIDatePicker.Mode.date
        
        datePicker.addTarget(self, action: #selector(RegisterController.datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        
        birthdateTextField.inputView = datePicker
        
        
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
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            genderTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            birthdateTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
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
    
    @IBAction private func signUpTapped(_ sender: Any) {
        
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
            let gender = genderTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let birth_date = birthdateTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create user
            let User1 = Profile(firstname: first_Name, lastname: last_Name, email: email, password: password, gender: gender, birthdate: birth_date)
            CreateUsers.CreateUser(user: User1)
            
            transitionToHome()
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
    
    //function for datepicker at registerscreen
    @objc private func datePickerValueChanged(sender: UIDatePicker) {
        
        let formatter = DateFormatter()
       
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd")
        
        
        birthdateTextField.text = formatter.string(from: sender.date)
    }
}

