//
//  CreateUser.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 11/01/2021.
//

import UIKit
import Firebase
import FirebaseAuth

//-----class CreateUsers-----//

class CreateUsers {
    
    //create the user
    static func CreateUser(user: Profile) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (result, err) in
    
    
            //user is created succesfully (store firstname, lastname, gender and birth date)
            let db = Firestore.firestore()
            
            db.collection("users").document(result!.user.uid).setData([
                                    "first_name": user.firstname,
                                    "last_name": user.lastname,
                                    "gender": user.gender,
                                    "birth_date": user.birthdate])
            }
    }
}
