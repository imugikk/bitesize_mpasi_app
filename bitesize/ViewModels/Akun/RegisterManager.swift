//
//  RegisterManager.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/10/23.
//

import Foundation
import FirebaseAuth

class RegisterManager: ObservableObject {
    
    var firestoremanager = FirestoreManager()
    
    var email: String = ""
    var password: String = ""
    var name: String = ""
    
        func register(completion: @escaping () -> Void) {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    completion()
                }
            }
        }
    
    func registerWithAppleId(completion: @escaping () -> Void) {
        firestoremanager.createAppleUser(email: email) {
            completion()
        }
    }
    
    }




