//
//  LoginViewController.swift
//  zapEfron
//
//  Created by Juliana Prado on 25/01/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let err = error{
                    print(err)
                } else{
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
