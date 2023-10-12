//
//  RegisterManager.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/10/23.
//

import Foundation
import FirebaseAuth

class RegisterManager: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    
    func register(completion: @escaping () -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                completion()
            }
        }
    }
    
}
