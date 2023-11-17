//
//  ProfileViewModel.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 11/11/23.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseStorage

class ProfileViewModel: ObservableObject {
    
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { try await loadImage() } }
    }
    
    @Published var profileImage: Image?
    
    func loadImage() async throws {
        guard let item = selectedItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: imageData) else {return}
        
        // Save image data to Firebase Storage
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let profileImage = storageRef.child("profile_images/\(UUID().uuidString).jpg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        _ = profileImage.putData(imageData, metadata: metadata) { (metadata, error) in
            guard let _ = metadata else {
                print("Error uploading image: \(error?.localizedDescription ?? "")")
                return
            }
            
            // Image uploaded successfully, now save profile data to Firestore (or Realtime Database)
            self.saveProfileData(imageURL: profileImage.fullPath)
        }
        
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func saveProfileData(imageURL: String) {
        // Save additional profile data to Firestore (or Realtime Database)
        let db = Firestore.firestore()
        let userId = Auth.auth().currentUser?.uid ?? ""
        let babyRef = db.collection("Babies").whereField("userId", isEqualTo: userId)
            
        babyRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
            } else {
                // Check if there is at least one document
                if let document = querySnapshot?.documents.first {
                    // Use the document reference to update the document
                    let documentReference = document.reference

                    documentReference.updateData([
                        "profileImageURL": imageURL
                        // Add other profile data as needed
                    ]) { error in
                        if let error = error {
                            print("Error updating document: \(error.localizedDescription)")
                        } else {
                            print("Document updated successfully!")
                        }
                    }
                } else {
                    print("No matching documents found.")
                }
            }
        }
    }
}
