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
    var zscore: [Double] = []
    var items: [Babies] = []
    
    
    
    init(){
        fetchAllUsers()
    }
    
    var email: String = ""
    var password: String = ""
    
    func login(completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.getBabiesData { babies in
                    let hasBabies = !babies.isEmpty
                    print(hasBabies)
                  
                    completion(hasBabies)
                }
            }
        }
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
    
    //apple ID
    func createAppleUser(email: String, completion: @escaping () -> Void) {
        let docRef = db.collection("User Apple ID").document(email)
        
        docRef.setData(["email": email]){ error in
            if let error = error {
                print("Error writing documents: \(error)")
            } else {
                print("Document successfully written!")
                completion()
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
    func getMenuesData(completion: @escaping ([[Any]]) -> Void) {
        let docRef = db.collection("Menu").whereField("Kategori", isEqualTo: "Makanan Utama")
        docRef.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion([])
                return
            }

            var menues: [[Any]] = []
            for document in snapshot!.documents {
                let data = document.data()
                let menuId = document.documentID as! String
                let menuName = data["Name"] as! String
                let menuCalories = data["Calories"] as! Double
                let menuType = data["Jenis"] as? [String]
                
                menues.append([menuName, menuCalories, menuType, menuId])
            }
            completion(menues)
        }
    }
    
    //read menu's data
    func getMenuCemilanData(completion: @escaping ([[Any]]) -> Void) {
        let docRef = db.collection("Menu").whereField("Kategori", isEqualTo: "Cemilan")
        docRef.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion([])
                return
            }

            var menues: [[Any]] = []
            for document in snapshot!.documents {
                let data = document.data()
                let menuId = document.documentID as! String
                let menuName = data["Name"] as! String
                let menuCalories = data["Calories"] as! Double
                let menuType = data["Jenis"] as! [String]
                
                menues.append([menuName, menuCalories, menuType, menuId])
            }
            completion(menues)
        }
    }
    
    //read detail Menu
    func getDetailMenu(menuId: String, completion: @escaping (Menu?) -> Void) {
        let docRef = db.collection("Menu").document(menuId)
        
        docRef.getDocument{ (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    let desc = data["Desc"] as! String
                    let bahan = data["Bahan"] as! [String:[String:String]]
                    let step = data["Steps"] as! [String]
                    let kalori = data["Calories"] as! Double
                    let nutrisi = data["Nutrisi"] as! [String: Double]
                    let name = data["Name"] as! String
                    let usia = data["Usia"] as! Int
                    let jenis = data["Jenis"] as! [String]
                    
                    let menu = Menu(name: name, desc: desc, step: step, nutrisi: nutrisi, kalori: kalori, bahan: bahan, usia: usia, jenis: jenis)
                                    
                    completion(menu)
                }
            }
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
                        
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let currentSumber = document.data()?["Sumber"] as? [String] ?? []
                    var updatedSumber = currentSumber
                    if let newSumber = i.Sumber as? [String] {
                        updatedSumber.append(contentsOf: newSumber)
                    }
                    
                    docRef.updateData(["Sumber": updatedSumber]) { error in
                        if let error = error {
                            print("Error updating document: \(error)")
                        } else {
                            print("Document successfully updated!")
                        }
                    }
                } else {
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
    
    //get menu recommendation
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
            } else {
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
            }
        }
    }
    
    //add data baby
    func addBabyData(height: Double, weight: Double, hc: Double, time: Date){
        let userId = Auth.auth().currentUser?.uid ?? ""
        let babiesCollection = db.collection("Babies")
        
        babiesCollection.whereField("userId", isEqualTo: userId).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error querying documents: \(error)")
                return
            }
            
            if let document = querySnapshot?.documents.first {
                let docRef = babiesCollection.document(document.documentID)

                let data = [
                    "height": FieldValue.arrayUnion([height]),
                    "weight": FieldValue.arrayUnion([weight]),
                    "hc": FieldValue.arrayUnion([hc]),
                    "timeMeasure": FieldValue.arrayUnion([time])
                ]
                
                print("test")

                docRef.updateData(data) { error in
                    if let error = error {
                        print("Error updating document: \(error)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
        }
    }
    
    func reloadData() {
        getBabiesData { babies in
            self.items = babies
        }
    }
    
    func getCategoryMenu(jenis: String, completion: @escaping ([[Any]]) -> Void) {
        let docRef = db.collection("Menu").whereField("Jenis", arrayContains: jenis)
        docRef.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion([])
                return
            }

            var menues: [[Any]] = []
            for document in snapshot!.documents {
                let data = document.data()
                let menuId = document.documentID 
                let menuName = data["Name"] as! String
                let menuCalories = data["Calories"] as! Double
                let menuType = data["Jenis"] as! [String]
                
                menues.append([menuName, menuCalories, menuType, menuId])
            }
            print(menues)
            completion(menues)
        }
    }
    
    func getGiziBabies(completion: @escaping ([Double]) -> Void) {
        let userId = Auth.auth().currentUser?.uid ?? ""
        let babiesCollection = db.collection("Babies").whereField("userId", isEqualTo: userId)
        
        babiesCollection.getDocuments { snapshot, error in
            if let error = error {
                print("Error querying documents: \(error)")
                completion([])
                return
            }
            
            var gizi: [Double] = []
            for document in snapshot!.documents {
                let data = document.data()
                print(data)
                if let giziArray = data["gizi"] as? [Double] {
                    gizi.append(contentsOf: giziArray)
                }
            }
            completion(gizi)
        }
    }
    
    func editGiziBabies(calori: [Double], carbs: Double, fat: Double, protein: Double) {
        let userId = Auth.auth().currentUser?.uid ?? ""
        let babiesCollection = db.collection("Babies").whereField("userId", isEqualTo: userId)
        
        babiesCollection.getDocuments { snapshot, error in
            if let error = error {
                print("Error querying documents: \(error)")
                return
            }
            
            guard let document = snapshot?.documents.first else {
                print("Document not found")
                return
            }
            
            var giziArray = document.data()["gizi"] as? [Double] ?? []
            
            giziArray.append(contentsOf: [carbs, fat, protein])
            
            document.reference.updateData(["gizi": [carbs, fat, protein], "nutrition": calori]) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
    }
    
    func savedMenu(menuId: [String]) {
        let userId = Auth.auth().currentUser?.uid ?? ""
        let babyRef = db.collection("Babies").whereField("userId", isEqualTo: userId)
        
        babyRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    if var menuIds = document.data()["menuId"] as? [String] {
                        menuIds.append(contentsOf: menuId)
                        document.reference.updateData(["menuId": menuIds])
                    } else {
                        document.reference.setData(["menuId": menuId], merge: true)
                    }
                }
            }
        }
    }
    
    func deleteSavedMenu(menuId: String) {
        let userId = Auth.auth().currentUser?.uid ?? ""
        let babyRef = db.collection("Babies").whereField("userId", isEqualTo: userId)
        
        babyRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    var menuIdArray = document["menuId"] as? [String] ?? []
                    
                    if let index = menuIdArray.firstIndex(of: menuId) {
                        menuIdArray.remove(at: index)
                        
                        document.reference.updateData(["menuId": menuIdArray]) { error in
                            if let error = error {
                                print("Error updating document: \(error)")
                            } else {
                                print("Document updated successfully")
                            }
                        }
                    }
                }
            }
        }
    }
    
    func isMenuSaved(menuId: String, completion: @escaping (Bool) -> Void) {
        let userId = Auth.auth().currentUser?.uid ?? ""
        let babyRef = db.collection("Babies").whereField("userId", isEqualTo: userId)

        babyRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion(false)
            } else {
                if let document = querySnapshot?.documents.first {
                    let savedMenuIds = document["menuId"] as? [String] ?? []
                    let isSaved = savedMenuIds.contains(menuId)
                    completion(isSaved)
                } else {
                    completion(false)
                }
            }
        }
    }
    
    func getSavedMenu(completion: @escaping ([[String: Any]]) -> Void) {
        let userId = Auth.auth().currentUser?.uid ?? ""
        let babyRef = db.collection("Babies").whereField("userId", isEqualTo: userId)
        
        babyRef.getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                completion([])
            } else {
                if let document = querySnapshot?.documents.first {
                    let menuIds = document["menuId"] as? [String] ?? []
                    var menuDataArray: [[String: Any]] = []
                    
                    let dispatchGroup = DispatchGroup()
                    for menuId in menuIds {
                        dispatchGroup.enter()
                        let menuRef = self.db.collection("Menu").document(menuId)
                        menuRef.getDocument { menuDocument, menuError in
                            defer {
                                dispatchGroup.leave()
                            }

                            if let menuError = menuError {
                                print("Error getting menu document: \(menuError)")
                            } else if let menuDocument = menuDocument, menuDocument.exists {
                                // Get the menu data and add it to the array
                                let data = menuDocument.data() ?? [:]
                                let menuName = data["Name"] as? String ?? ""
                                let menuCalories = data["Calories"] as? Double ?? 0.0
                                let menuType = data["Jenis"] as? [String] ?? []
                                let bahan = data["Bahan"] as? [String:[String: String]] ?? [:]

                                let menuDictionary: [String: Any] = [
                                    "menuId": menuId,
                                    "menuName": menuName,
                                    "menuCalories": menuCalories,
                                    "menuType": menuType,
                                    "bahan": bahan
                                ]

                                menuDataArray.append(menuDictionary)
                            }
                        }
                    }
                    
                    dispatchGroup.notify(queue: .main) {
                        completion(menuDataArray)
                    }
                } else {
                    completion([])
                }
            }
        }
    }
}
