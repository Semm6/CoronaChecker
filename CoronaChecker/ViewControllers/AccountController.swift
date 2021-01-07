//
//  AccountController.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 06/01/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class AccountController: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var fetchDataButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var removeAccountButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func fetchDataButton(_ sender: Any) {
        
        let id = Auth.auth().currentUser!.uid
        
            let DocRefernce:DocumentReference!
            let db = Firestore.firestore()
            DocRefernce = db.collection("users").document(id)
            DocRefernce.getDocument { (docSnapshot, error) in
                if error != nil {
                    print(error!)
                } else {
                    guard let snapshot = docSnapshot, snapshot.exists else { return }
                    guard let data = snapshot.data() else { return }
                    
                    let firstname = data["first_name"] as? String ?? "no name"
                    self.nameTextField.text = firstname
                    
                    let gender = data["gender"] as? String ?? "no gender"
                    self.genderTextField.text = gender
                    
                    let email = (Auth.auth().currentUser?.email)! as String
                    self.emailTextField.text = email
                    

                }
            }
        }
    
    @IBAction private func logOutButton(_ sender: Any) {
    
            //log out
            do { try Auth.auth().signOut() }
            catch { print("already logged out") }
            
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "StartController") as! StartController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
        }
    }
    
    
    @IBAction private func removeAccountButton(_ sender: Any) {
        
        let id = Auth.auth().currentUser!.uid
        
        db.collection("users").document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        
        let user = Auth.auth().currentUser
        user?.delete { error in
            if error != nil {
            // An error happened.
          } else {
            // Account deleted.
          }
        }
        
    }
    
}
        

    
    
    

