//
//  ShowAlert.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 11/01/2021.
//

import UIKit

//-----class alertHandler-----//

class AlertHandler {
    
    var title: String
    var message: String
    
    init(title:String, message:String) {
        self.title = title
        self.message = message
    }
}

extension UIViewController {
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message:
      message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
    }))
    self.present(alertController, animated: true, completion: nil)
  }
}



