//
//  RegisterView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/10/23.
//

import SwiftUI
import _AuthenticationServices_SwiftUI
import AuthenticationServices

struct RegisterView: View, SecuredTextFieldParentProtocol {
    var hideKeyboard: (() -> Void)?
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var registerVM = RegisterManager()
    @StateObject private var authVM = AuthenticationViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    
    @State private var isRegistrationSuccessful = false
    
    @Binding var isRegister : Bool
    
    private var isSignedIn: Bool {
        !email.isEmpty
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Register to Bitesize")
                    .font(
                        Font.custom("Nunito", size: 32)
                            .weight(.semibold)
                    )
                    .kerning(0.32)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                    .padding(.leading, 16)
                
                Divider()
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    .padding(.bottom, 20)
                
                TextAccountView(labelText: "Full Name")
                    .edgesIgnoringSafeArea(.all)
                
                TextField("Input your full name", text: $registerVM.name)
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
                
                TextAccountView(labelText: "Email")
                    .edgesIgnoringSafeArea(.all)
                
                TextField("Input your email", text: $registerVM.email)
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
                
                SecuredTextFieldView(text: $authVM.password, parent: self, type: .password)
                
                VStack(alignment: .leading) {
                    RequirementsPickerView(type: .eightChar, toggleState: $authVM.hasEightChar)
                    RequirementsPickerView(type: .spacialChar, toggleState: $authVM.hasSpacialChar)
                    RequirementsPickerView(type: .oneDigit, toggleState: $authVM.hasOneDigit)
                    RequirementsPickerView(type: .upperCaseChar, toggleState: $authVM.hasOneUpperCaseChar)
                }
                
                TextAccountView(labelText: "Confirm New Password")
                    .edgesIgnoringSafeArea(.all)
                
                SecuredTextFieldView(text: $registerVM.password, parent: self, type: .repeatPassword)
                
                
                Spacer()
                
                Button("Sign Up"){
                    registerVM.register {
                        isRegister = true
                        isRegistrationSuccessful = true
                        //                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
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
                            
//                            self.email = email ?? ""
                            isRegister = true

                            self.email = userId
                            self.firstName = firstName ?? ""
                            
//                            print(email, "+", userId)
                            registerVM.email = credential.user
                            registerVM.registerWithAppleId {
                                //                                presentationMode.wrappedValue.dismiss()
                                isRegistrationSuccessful = true
                            }
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
                
            }/*.padding()*/
            .onAppear {
                if isRegistrationSuccessful {
                    // Navigate to ContentView after successful registration
                    NavigationLink(
                        destination: ContentView(),
                        isActive: $isRegistrationSuccessful
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
        }
    }
}
        
//        #Preview {
//            RegisterView()
//        }
