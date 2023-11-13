//
//  ProfileView.swift
//  bitesize
//
//  Created by Michelle Annice on 09/11/23.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("email") var email: String = ""
    @State var showSheet: Bool = false
    
    var body: some View {
        
        NavigationStack{
            
            Text("Profile")
              .font(
                Font.custom("Nunito", size: 32)
                  .weight(.semibold)
              )
              .kerning(0.32)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
              
              .padding(.horizontal, 16)
              .padding(.top, 46)
            
            Divider()
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        

        Text("Your Baby")
          .font(
            Font.custom("Nunito", size: 24)
              .weight(.semibold)
          )
          .kerning(0.24)
          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 16)
          .padding(.bottom, 8)

        
        UserProfileCard()
            .padding(.horizontal, 16)
            
            VStack{
                NavigationLink(destination: YourAccountView()) {
                    HStack {
                        Image("Profiles")
                            .frame(width: 24, height: 24)
                        
                        Text("Your Account")
                            
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                        
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)

                }
               
                Divider()
                    .padding(.horizontal, 76)
                
                NavigationLink {
                    SavedMenuView()
                } label: {
                    HStack {
                        Image("Group")
                            .frame(width: 24, height: 24)
                        
                        Text("Saved Menu")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                        
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)
                }

                
                
                Divider()
                    .padding(.horizontal, 76)
                
                
                
                
                Button(action: {
                    
                    showSheet.toggle()
                    
                }, label: {
                    HStack {
                        Image("Terms")
                            .frame(width: 24, height: 24)
                        
                        Text("Terms & Condition")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)

                })
                .sheet(isPresented: $showSheet, content: {
                    TermsView()
                .presentationDragIndicator(.visible)
                    
                })
            
                Divider()
                    .padding(.horizontal, 76)
                
                NavigationLink {
                    FAQView()
                } label: {
                    HStack {
                        Image("FAQ")
                            .frame(width: 24, height: 24)
                        
                        Text("Frequently Asked Questions")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)
                }

                Divider()
                    .padding(.horizontal, 76)
                HStack {
                    Image("Questions")
                        .frame(width: 24, height: 24)
                    
                    Text("Help")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                        .padding(.leading, 16)
                    
                    Text(">")
                        .font(
                            Font.custom("SF Pro", size: 17)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                        .padding(.trailing, 32)
                }
                .padding(.top, 8)
                .padding(.leading, 32)
                Divider()
                    .padding(.horizontal, 76)
                NavigationLink {
                    LoginView()
                } label: {
                    HStack {
                        Image("LogoutIcon")
                            
                            .frame(width: 24, height: 24)
                        
                        Text("Log Out")
                            .onTapGesture {
                            email = ""
                        }
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)
                    
                }
                
                Divider()
                    .padding(.horizontal, 76)
                
//                Spacer()
//                NavigationLink(destination: LoginView().navigationBarHidden(true)) {
//                    Text("Log out").onTapGesture {
//                        email = ""
//                    }
//                }
Spacer()
            }.navigationBarHidden(true)
               
                
        }
        
        
//        NavigationStack{
//            NavigationLink(destination: LoginView().navigationBarHidden(true)) {
//                Text("Log out").onTapGesture {
//                    email = ""
//                }
//            }
//        }
    }
}

#Preview {
    ProfileView()
}
