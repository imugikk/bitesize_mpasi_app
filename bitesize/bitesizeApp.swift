//
//  bitesizeApp.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/09/23.
//

import SwiftUI

@main
struct bitesizeApp: App {
    //set up firebase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
