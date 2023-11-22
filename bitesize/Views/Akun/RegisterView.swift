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
    
    @State private var isPressed = false
        
    @State private var showingSheet = false
    
    @Binding var isRegister : Bool
    
    private var isSignedIn: Bool {
        !email.isEmpty
    }
    
    var body: some View {
//        ScrollView{
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
                
                Spacer()
                
                Image("BiteSizeLogo")
                    .resizable()
                    .frame(width: 300, height: 250)
                
                Spacer()
                
//                TextAccountView(labelText: "Full Name")
//                    .edgesIgnoringSafeArea(.all)
//                
//                TextField("Input your full name", text: $registerVM.name)
//                    .padding(.leading, 16)
//                    .padding(.vertical, 13)
//                    .frame(width: 358, height: 50, alignment: .leading)
//                    .background(.white)
//                
//                    .cornerRadius(8)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .inset(by: 0.25)
//                            .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
//                    )
//                    .padding(.bottom, 16)
//                
//                TextAccountView(labelText: "Email")
//                    .edgesIgnoringSafeArea(.all)
//                
//                TextField("Input your email", text: $registerVM.email)
//                    .padding(.leading, 16)
//                    .padding(.vertical, 13)
//                    .frame(width: 358, height: 50, alignment: .leading)
//                    .background(.white)
//                
//                    .cornerRadius(8)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .inset(by: 0.25)
//                            .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
//                    )
//                    .padding(.bottom, 16)
//                
//                TextAccountView(labelText: "Password")
//                    .edgesIgnoringSafeArea(.all)
//                
//                SecuredTextFieldView(text: $authVM.password, parent: self, type: .password)
//                
//                VStack(alignment: .leading) {
//                    HStack{
//                        RequirementsPickerView(type: .eightChar, toggleState: $authVM.hasEightChar)
//                        RequirementsPickerView(type: .spacialChar, toggleState: $authVM.hasSpacialChar)
//                    }
//                    
//                    HStack{
//                        RequirementsPickerView(type: .oneDigit, toggleState: $authVM.hasOneDigit)
//                        RequirementsPickerView(type: .upperCaseChar, toggleState: $authVM.hasOneUpperCaseChar)
//                    }
//                }
//                .padding(.bottom, 14)
//                
//                TextAccountView(labelText: "Confirm New Password")
//                    .edgesIgnoringSafeArea(.all)
//                
//                SecuredTextFieldView(text: $registerVM.password, parent: self, type: .repeatPassword)
//                
//                
//                HStack(alignment: .center, spacing: 12) {
//                    Button(action: {
//                    // Toggle the state when the button is pressed
//                        isPressed.toggle()}) {
//                            Image(systemName: isPressed ? "checkmark.square.fill" : "square")
//                                .resizable()
//                                .frame(width: 24, height: 24)
//                                .foregroundColor(.black)
//                            }
//                    
//                    HStack {
//                        Text("I agree with")
//                            .font(Font.custom("Inter", size: 14))
//                            .kerning(0.08)
//                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                                
//                        
//                        Button {
//                            showingSheet.toggle()
//                        } label: {
//                            Text("terms and conditions")
//                                .font(Font.custom("Inter", size: 14))
//                                .kerning(0.4)
//                                .multilineTextAlignment(.center)
//                                .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
//                        }
//                            .sheet(isPresented: $showingSheet) {
//                                TermsandConditionsView()
//                                    .presentationDragIndicator(.visible)
//                            }
//                    }
//                    
//                    
//                }
//                .padding(0)
//                .padding(.bottom, 16)
//                .frame(width: 358, height: 20, alignment: .leading)
//                
//                Spacer()
//                
//                Button{
//                    registerVM.register {
//                        email = registerVM.email
//                        isRegister = true
//                        isRegistrationSuccessful = true
//                    }
//                } label: {
//                    HStack(alignment: .center, spacing: 4) {
//                        Text("Sign Up")
//                            .font(
//                                Font.custom("Inter", size: 16)
//                                    .weight(.medium)
//                            )
//                            .kerning(0.2)
//                            .foregroundColor(isPressed ? Color(red: 0.93, green: 0.98, blue: 0.96) : Color(red: 0.5, green: 0.53, blue: 0.53))
//                    }
//                    .padding(.horizontal, 24)
//                    .padding(.vertical, 8)
//                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
//                    .background(isPressed ? Color(red: 0.18, green: 0.56, blue: 0.42) : Color(red: 0.96, green: 0.96, blue: 0.96))
//                    .cornerRadius(12)
//                    
//                    .padding(.horizontal, 16)
//                    
//                }
//                .padding(.bottom, 16)
//                
//                HStack(alignment: .center, spacing: 12) {
//                    Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 159, height: 1)
//                        .background(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    
//                    Text("or")
//                        .font(Font.custom("Inter", size: 16))
//                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    
//                    Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 159, height: 1)
//                        .background(Color(red: 0.08, green: 0.12, blue: 0.12))
//                }
//                .padding(0)
//                .frame(width: 358, alignment: .leading)
                
                Spacer()
                
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
            .background(Color(red: 0.93, green: 0.98, blue: 0.96))
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
//        }
    }
}
        
//        #Preview {
//            RegisterView()
//        }
