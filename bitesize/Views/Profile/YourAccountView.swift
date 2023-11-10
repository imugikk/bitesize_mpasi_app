//
//  YourAccountView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 10/11/23.
//

import SwiftUI

struct YourAccountView: View {
    @State private var selectedOption = 0
    @State private var selectedSegment: Int = 0
    @State private var detailMenu: Menu?
    @State var segmentedChoice = 0
        
    var body: some View {
        
        
        VStack {
            LazyHStack(spacing: 0){
                    Button(action: {
                        selectedSegment = 0
                    }) {
                        HStack {
                            Text("Personal Information")
                        }
                        .modifier(TextButtonStyle2(selectedSegment: selectedSegment, tag: 0))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        selectedSegment = 1
                    }) {
                        HStack {
                            Text("Change Password")
                        }
                        .modifier(TextButtonStyle2(selectedSegment: selectedSegment, tag: 1))
                    }
                    
                    Spacer()
                    
                    
                   
            }
        }
        .frame(height: 30, alignment: .center)
        
            if(selectedSegment == 0){
                personalInformation()
            }
            
            if(selectedSegment == 1){
                changePassword()
            }
            
    Spacer()
        }

    
    }

//page personal info
struct personalInformation: View {
    @State var Name = ""
    @State var Email = ""
    @State var selectedSegment = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Name")
              .font(
                Font.custom("Inter", size: 16)
                  .weight(.semibold)
              )
              .kerning(0.16)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(width: 317, height: 22, alignment: .leading)
              .padding(.bottom, 4)
            TextField("Input your name" , text: $Name).padding(.leading, 16)
                .padding(.vertical, 13)
                .frame(width: 358, height: 50, alignment: .leading)
                .background(.white)
            
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                )
            
        }
        .padding(0)
        .frame(width: 358, alignment: .topLeading)
        .padding(.top, 20)
        .padding(.horizontal, 16)
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Email")
              .font(
                Font.custom("Inter", size: 16)
                  .weight(.semibold)
              )
              .kerning(0.16)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(width: 317, height: 22, alignment: .leading)
              .padding(.bottom, 4)
            TextField("Input Email" , text: $Name).padding(.leading, 16)
                .padding(.vertical, 13)
                .frame(width: 358, height: 50, alignment: .leading)
                .background(.white)
            
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                )
            
        }
        .padding(0)
        .frame(width: 358, alignment: .topLeading)
        .padding(.top, 20)
        .padding(.horizontal, 16)
        
    }
}

//page change password
struct changePassword: View {
    @State var oldPassword = ""
    @State var newPassword = ""
    @State var confirmPassword = ""
    @State var selectedSegment = 1
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Old Password")
              .font(
                Font.custom("Inter", size: 16)
                  .weight(.semibold)
              )
              .kerning(0.16)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(width: 317, height: 22, alignment: .leading)
              .padding(.bottom, 4)
          
            TextField("Input your name" , text: $oldPassword)
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
            
        }
        .padding(0)
        .frame(width: 358, alignment: .topLeading)
        .padding(.top, 20)
        .padding(.horizontal, 16)
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("New Password")
              .font(
                Font.custom("Inter", size: 16)
                  .weight(.semibold)
              )
              .kerning(0.16)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(width: 317, height: 22, alignment: .leading)
              .padding(.bottom, 4)
          
            TextField("New Password" , text: $newPassword)
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
            
        }
        .padding(0)
        .frame(width: 358, alignment: .topLeading)
        .padding(.top, 20)
        .padding(.horizontal, 16)
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Confirm Password")
              .font(
                Font.custom("Inter", size: 16)
                  .weight(.semibold)
              )
              .kerning(0.16)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(width: 317, height: 22, alignment: .leading)
              .padding(.bottom, 4)
          
            TextField("Confirm Password" , text: $newPassword)
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
            
        }
        .padding(0)
        .frame(width: 358, alignment: .topLeading)
        .padding(.top, 20)
        .padding(.horizontal, 16)
    
        Spacer()
        HStack{
          
            Text("Update Password")
              .font(
                Font.custom("Inter", size: 14)
                  .weight(.medium)
              )
              .kerning(0.4)
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.93, green: 0.98, blue: 0.96))
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
        .frame(width: 358, height: 36, alignment: .center)
        .background(Color(red: 0.18, green: 0.56, blue: 0.42))
        .cornerRadius(8)
    }
}

struct TextButtonStyle2: ViewModifier {
    var selectedSegment: Int?
    var tag: Int

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .font(Font.custom("Inter", size: 16).weight(.medium))
            .kerning(0.2)
            .multilineTextAlignment(.center)
            .foregroundColor(selectedSegment == tag ? Color.white : Color(red: 0.16, green: 0.49, blue: 0.36))
            .background(selectedSegment == tag ? Color(red: 0.16, green: 0.49, blue: 0.36) : Color.clear)
            .cornerRadius(16)
    }
}


#Preview {
    YourAccountView()
}
