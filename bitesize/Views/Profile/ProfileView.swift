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
     
        
            Text("Profile")
              .font(
                Font.custom("Nunito", size: 32)
                  .weight(.semibold)
              )
              .kerning(0.32)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
              .padding(.bottom, 12)
              .padding(.horizontal, 16)
              .padding(.top, 46)
            
            Divider()
            .padding(.horizontal, 16)
        

        Text("Your Baby")
          .font(
            Font.custom("Nunito", size: 24)
              .weight(.semibold)
          )
          .kerning(0.24)
          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 16)
          .padding(.top, 12)
          .padding(.bottom, 8)

        
        UserProfileCard()
            .padding(.horizontal, 16)
        
        VStack{
            HStack {
                Image("Profiles")
                .frame(width: 24, height: 24)

                Text("Your Account")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
              .padding(.leading, 16)
                
                Text("􀆊")
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
                .padding(.leading, 76)
            HStack {
                Image("Group")
                .frame(width: 24, height: 24)
            
                Text("Saved Menu")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                  .padding(.leading, 16)
                
                Text("􀆊")
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
            
            HStack {
                Image("Settings")
                .frame(width: 24, height: 24)

                Text("Settings")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
              .padding(.leading, 16)
                
                Text("􀆊")
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
            
            HStack {
                Image("Terms")
                .frame(width: 24, height: 24)

                Text("Terms & Condition")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
              .padding(.leading, 16)
                
                Text("􀆊")
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
            
            HStack {
                Image("FAQ")
                .frame(width: 24, height: 24)

                Text("Frequently Asked Questions")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
              .padding(.leading, 16)
                
                Text("􀆊")
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
            HStack {
                Image("Questions")
                .frame(width: 24, height: 24)

                Text("Help")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
              .padding(.leading, 16)
                
                Text("􀆊")
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
        }
        
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
