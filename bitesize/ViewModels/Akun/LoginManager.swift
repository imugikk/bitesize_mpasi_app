//
//  LoginManager.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/10/23.
//

import Foundation
import Firebase

class LoginManager: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    
    func login(completion: @escaping () -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                completion()
            }
        }
        
    }
}
