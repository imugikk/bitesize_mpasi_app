//
//  ProfileView.swift
//  bitesize
//
//  Created by Michelle Annice on 09/11/23.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("email") var email: String = ""
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: LoginView().navigationBarHidden(true)) {
                Text("Log out").onTapGesture {
                    email = ""
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
