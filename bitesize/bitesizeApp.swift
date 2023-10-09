//
//  bitesizeApp.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/09/23.
//

import SwiftUI
import Firebase

@main
struct bitesizeApp: App {
    //set up firebase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var firestoreManager = FirestoreManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(firestoreManager)
        }
    }
}
