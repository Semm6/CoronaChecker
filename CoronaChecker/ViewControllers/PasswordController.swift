//
//  PasswordController.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 18/12/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class PasswordController: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var btnResetPassword: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction private func btnResetPassword(_ sender: UIButton) {
        
        Auth.auth().sendPasswordReset(withEmail: emailField.text!) { (error) in
            if error == nil {
                print("SEND!!!")
            }else {
                print("FAILED - \(String(describing: error?.localizedDescription))")
            }
        
        }
    }
}
