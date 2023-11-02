//
//  Firestoremanager.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/09/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreManager: ObservableObject {
    let db = Firestore.firestore()
    @Published var user: String = ""
    var items: [Babies] = []
    var zscore: [Double] = []
    
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
    
    func fetchUserId() -> String {
        return Auth.auth().currentUser?.uid ?? ""
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
    
    //create z-score
    func createZScore(zscore: ZScoreResult) {
        let docRef = db.collection("ZScore")
        
        do {
            let newDocRef = try docRef.addDocument(from: zscore)
            print("Baby's z-score data stored with new document reference: \(newDocRef)")
        }
        catch {
            print(error)
        }

    }
    
    //read baby's data
    func getBabiesData(completion: @escaping ([Babies]) -> Void) {
        let userId = Auth.auth().currentUser?.uid ?? ""
        db.collection("Babies")
            .whereField("userId", isEqualTo: userId)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                    completion([])
                    return
                }

                var babies: [Babies] = []
                for document in snapshot!.documents {
                    if let baby = try? document.data(as: Babies.self) {
                        babies.append(baby)
                    }
                }

                completion(babies)
            }
    }
    
    //read menu's data
    func getMenuesData(completion: @escaping ([String]) -> Void) {
        let docRef = db.collection("Menu").whereField("Kategori", isEqualTo: "Makanan Utama")
        docRef.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion([])
                return
            }

            var menues: [String] = []
//            for document in snapshot!.documents {
//                if let menu = try? document.data(as: Menu.self) {
//                    menues.append(menu)
//                }
//            }
            
            for document in snapshot!.documents {
//                print("\(document.documentID): \(document.data())")
                let data = document.data()
                menues.append(data["Name"] as! String)
            }
            print(menues)
            completion(menues)
        }
    }
    
    //create calories needed
    func createCaloriesNeeded(caloriesneeded: CaloriesNeededResult) {
        let docRef = db.collection("Calories")
        
        do {
            let newDocRef = try docRef.addDocument(from: caloriesneeded)
            print("Baby's calories data stored with new document reference: \(newDocRef)")
        }
        catch {
            print(error)
        }
    }
    
    //create bahan
    func createCarbo(bahan: [Bahan]) {
        for i in bahan {
            
            let docRef = db.collection("Ingridients").document(i.id)
                        
            // Check if the document with the specified ID exists
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    // Document exists, update the "sumber" field by adding new data to the array
                    let currentSumber = document.data()?["Sumber"] as? [String] ?? []
                    print(currentSumber)
                    var updatedSumber = currentSumber
                    if let newSumber = i.Sumber as? [String] {
                        updatedSumber.append(contentsOf: newSumber)
                    }
                    
                    // Update the document with the new "sumber" array
                    docRef.updateData(["Sumber": updatedSumber]) { error in
                        if let error = error {
                            print("Error updating document: \(error)")
                        } else {
                            print("Document successfully updated!")
                        }
                    }
                } else {
                    // Document doesn't exist, create a new document with the provided data
                    docRef.setData(["Berat": i.Berat, "Kalori": i.Kalori, "Kalori/g": i.KaloriG, "Protein": i.Protein, "Protein/g": i.ProteinG, "Karbo": i.Karbo, "Karbo/g": i.KarboG,"Lemak": i.Lemak, "Lemak/g": i.LemakG, "Sumber": i.Sumber]) { error in
                        if let error = error {
                            print("Error creating document: \(error)")
                        } else {
                            print("Document successfully created!")
                        }
                    }
                }
            }
        }
    }
    
    //create menu
    func createMenu(menu: [Menu]){
        for i in menu {
            let docRef = db.collection("Menu")
            
            docRef.addDocument(data: ["Name": i.name, "Bahan": i.bahan, "Steps": i.step, "Kategori": i.kategori]) { error in
                if let error = error {
                    print("Error creating document: \(error)")
                } else {
                    print("Document successfully created!")
                }
            }
        }
    }
    
    //get menu
    func getMenuRecommendation(completion: @escaping ([String]) -> Void) {
        getBabiesData() { fetchBabies in
            self.items = fetchBabies
            
            self.zscore = self.items.first?.zscore ?? []
            
            if self.zscore[0] < -2 {
                let docRef = self.db.collection("Menu")
                    .whereField("Jenis", arrayContains: "Standar")
                
                docRef.getDocuments { snapshot, error in
                    if let error = error {
                        print("Error fetching data: \(error.localizedDescription)")
                        completion([])
                        return
                    }

                    var menues: [String] = []
                    
                    for document in snapshot!.documents {
                        let data = document.data()
                        menues.append(data["Name"] as! String)
                    }
                    completion(menues)
                }
            } else if self.zscore[1] < -2 {
                let docRef = self.db.collection("Menu")
                    .whereField("Jenis", arrayContains: "Tinggi Protein")
                
                docRef.getDocuments { snapshot, error in
                    if let error = error {
                        print("Error fetching data: \(error.localizedDescription)")
                        completion([])
                        return
                    }

                    var menues: [String] = []
                    
                    for document in snapshot!.documents {
                        let data = document.data()
                        menues.append(data["Name"] as! String)
                    }
                    completion(menues)
                }
            } else if self.zscore[2] < -2 {
                let docRef = self.db.collection("Menu")
                    .whereField("Jenis", arrayContains: "Tinggi Lemak")
                
                docRef.getDocuments { snapshot, error in
                    if let error = error {
                        print("Error fetching data: \(error.localizedDescription)")
                        completion([])
                        return
                    }

                    var menues: [String] = []
                    
                    for document in snapshot!.documents {
                        let data = document.data()
                        menues.append(data["Name"] as! String)
                    }
                    completion(menues)
                }
            }
        }
    }
}
