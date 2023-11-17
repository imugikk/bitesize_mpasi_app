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
                Font.custom("Nunito-SemiBold", size: 32)
                  
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
            Font.custom("Nunito-SemiBold", size: 24)
             
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
                        Image("ProfilesIcon1")
                            .frame(width: 24, height: 24)
                        
                        Text("Your Account")
                            
                            .font(Font.custom("Inter-Regular", size: 16))
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
                        Image("SavedIcon1")
                            .frame(width: 24, height: 24)
                        
                        Text("Saved Menu")
                            .font(Font.custom("Inter-Regular", size: 16))
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
                        Image("DocumentIcon")
                            .frame(width: 24, height: 24)
                        
                        Text("Terms & Condition")
                            .font(Font.custom("Inter-Regular", size: 16))
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
                        Image("FAQIcon1")
                            .frame(width: 24, height: 24)
                        
                        Text("Frequently Asked Questions")
                            .font(Font.custom("Inter-Regular", size: 16))
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
                    Image("HelpIcon1")
                        .frame(width: 24, height: 24)
                    
                    Text("Help")
                        .font(Font.custom("Inter-Regular", size: 16))
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
                
             
                
//                    HStack {
//                        Image("LogOutIcon1")
//                            
//                            .frame(width: 24, height: 24)
//                        
//                        Text("Log Out")
//                            .font(Font.custom("Inter-Regular", size: 16))
//                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
//                            .padding(.leading, 16)
//                        
//                        Text(">")
//                            .font(
//                                Font.custom("SF Pro", size: 17)
//                                    .weight(.semibold)
//                            )
//                            .multilineTextAlignment(.center)
//                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
//                            .padding(.trailing, 32)
//                    }
//                    .onTapGesture {
//                    email = ""}
//                    .padding(.top, 8)
//                    .padding(.leading, 32)
                    
                Spacer()
                
                Button(action: {
                    email = ""
                }, label: {
                    HStack(alignment: .top, spacing: 4) {
                        Text("Log Out")
                        .font(
                        Font.custom("Inter", size: 14)
                        .weight(.medium)
                        )
                        .kerning(0.4)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .frame(width: 357, height: 36, alignment: .top)
                    .background(Color(red: 0.18, green: 0.56, blue: 0.42))

                    .cornerRadius(8)
                })
                .padding(.bottom, 24)
                
                
//                NavigationLink(destination: LoginView().navigationBarHidden(true)) {
//                    Text("Log out").onTapGesture {
//                        email = ""
//                    }
//                }

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
