//
//  Firestoremanager.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/09/23.
//

import Firebase
import FirebaseFirestore

class FirestoreManager: ObservableObject {
    let db = Firestore.firestore()
    @Published var user: String = ""
    
    init(){
        fetchAllUsers()
    }
    
    func fetchUser() {
        let docRef = db.collection("Users").document("user_1")
        
        docRef.getDocument{ (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.user = data["username"] as? String ?? ""
                }
            }
        }
    }
    
    //read
    func fetchAllUsers() {
        db.collection("Users").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID): \(document.data())")
                }
            }
            
        }
    }
    
    //create
    func createUser(username: String) {
        let docRef = db.collection("Users").document(username)
        
        docRef.setData(["username": username]){ error in
            if let error = error {
                print("Error writing documents: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    //update
    func updateUser(username: String, password: String){
        let docRef = db.collection("Users").document(username)
        
        docRef.updateData(["password": password]){ error in
            if let error = error {
                print("Error updating documents: \(error)")
            } else {
                print("Document successfully updated!")
            }
        }
    }
    
    //delete
    func deleteUser(username: String) {
        let docRef = db.collection("Users").document(username)
        
        docRef.delete(){ error in
            if let error = error {
                print("Error deleting documents: \(error)")
            } else {
                print("Document successfully deleted!")
            }
        }
    }
    
    //create baby's data
    func createBaby(baby: Babies) {
        let docRef = db.collection("Babies")
        
        do {
            let newDocRef = try docRef.addDocument(from: baby)
            print("Baby's data stored with new document reference: \(newDocRef)")
        }
        catch {
            print(error)
        }
    }
}
