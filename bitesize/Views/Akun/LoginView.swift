//
//  LoginView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/10/23.
//

import SwiftUI
import _AuthenticationServices_SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @State private var isPresented = false
    @State private var isActive = false
    @State private var isLogin = false
    @State private var isLoading = false
    
    @State private var isRegister = false
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    
    var body: some View {
        if email.isEmpty {
            NavigationStack{
                VStack{
                    Text("Welcome to Bitesize")
                        .font(
                            Font.custom("Nunito", size: 32)
                                .weight(.semibold)
                        )
                        .kerning(0.32)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                        .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                    
                    Divider()
                        .padding(.top, 12)
                        .padding(.bottom, 20)
                    
                    TextAccountView(labelText: "Email")
                        .edgesIgnoringSafeArea(.all)
                    
                    TextField("Email", text: $firestoreManager.email)
                        .padding(.leading, 16)
                        .padding(.vertical, 13)
                        .frame(width: 358, height: 50, alignment: .leading)
                        .background(.white)
                    
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.25)
                                .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                        )
                        .padding(.bottom, 16)
                    
                    TextAccountView(labelText: "Password")
                        .edgesIgnoringSafeArea(.all)
                    
                    SecureField("Password", text: $firestoreManager.password)
                        .padding(.leading, 16)
                        .padding(.vertical, 13)
                        .frame(width: 358, height: 50, alignment: .leading)
                        .background(.white)
                    
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.25)
                                .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                        )
                        .padding(.bottom, 16)
                    
                    Spacer()
                    
                    Button{
                        guard !firestoreManager.email.isEmpty, !firestoreManager.password.isEmpty else {
                            return
                        }
                        
                        isLogin = true
                        isLoading = true
                        firestoreManager.login { shouldNavigateToHome in
                            isActive = shouldNavigateToHome
                            isLoading = false
                        }
                    } label: {
                        HStack(alignment: .center, spacing: 4) {
                            Text("Sign In")
                                .font(
                                    Font.custom("Inter", size: 16)
                                        .weight(.medium)
                                )
                                .kerning(0.2)
                                .foregroundColor(Color(red: 0.5, green: 0.53, blue: 0.53))
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(12)
                        
                    }
                    .padding(.bottom, 16)
                    
                    HStack(alignment: .center, spacing: 12) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 159, height: 1)
                            .background(Color(red: 0.08, green: 0.12, blue: 0.12))
                        
                        Text("or")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 159, height: 1)
                            .background(Color(red: 0.08, green: 0.12, blue: 0.12))
                    }
                    .padding(0)
                    .frame(width: 358, alignment: .leading)
                    
                    SignInWithAppleButton(.continue) { request in
                        
                        request.requestedScopes = [.email, .fullName]
                        
                    } onCompletion: { result in
                        
                        switch result{
                        case.success(let auth):
                            
                            switch auth.credential{
                            case let credential as ASAuthorizationAppleIDCredential:
                                
                                // User ID
                                let userId = credential.user
                                
                                //User Info
                                let email = credential.email
                                let firstName = credential.fullName?.givenName
                                let lastName = credential.fullName?.familyName
                                
                                self.email = email ?? ""
                                isActive = true
                                
                            default:
                                break
                            }
                            
                        case.failure(let error):
                            print(error)
                            
                        }
                        
                    }
                    .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
                    .frame(height: 50)
                    .padding()
                    .cornerRadius(12)
                    
                    NavigationLink(destination: RegisterView(isRegister: $isRegister).navigationBarHidden(true), isActive: $isPresented) {
                        Text("Register now")
                    }
                    
                }.padding()
                .navigationDestination(isPresented: $isLogin){
                    if isLoading {
                        Text("Logging in...").navigationBarHidden(true)
                    } else if isActive {
                        HomeView()
                    } else {
                        ContentView()
                    }
                }
            }
        }
        else {
            if isRegister {
                ContentView()
            } else {
                
                HomeView()
            }
        }
    }
}

#Preview {
    LoginView()
}
