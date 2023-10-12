//
//  LoginView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var isPresented = false
    @State private var isActive = false
    @ObservedObject private var loginVM = LoginManager()
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Email", text: $loginVM.email).padding(.bottom,10)
                SecureField("Password", text: $loginVM.password)
                
                Button{
                    loginVM.login {
                        isActive = true
                    }
                } label: {
                        Text("Log In")
                }
                
                Button{
                    isPresented = true
                } label: {
                    Text("Create Account")
                }
        
            }.padding()
                .sheet(isPresented: $isPresented, content: {
                    RegisterView()
                })
                .navigationDestination(isPresented: $isActive){
                    HomeView()
                }
        }
    }
}

#Preview {
    LoginView()
}
