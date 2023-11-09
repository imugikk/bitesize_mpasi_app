//
//  EditProfileView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 10/11/23.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        @State var babyName = ""
        @State var babyAge = ""
        @State var babyGender = ""
        @State var showingActionSheet = false
       
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 100, height: 100)
                .background(
                    Image("PATH_TO_IMAGE")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .opacity(0.4)
                )
                .cornerRadius(100)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.5)
                    
                )
        
            Text("Add Photo")
                .font(
                    Font.custom("Inter", size: 16)
                        .weight(.semibold)
                )
                .kerning(0.16)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                .frame(width: 86, height: 30, alignment: .center)
    
    
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Name")
              .font(
                Font.custom("Inter", size: 16)
                  .weight(.semibold)
              )
              .kerning(0.16)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(width: 317, height: 22, alignment: .leading)
            TextField("Input your baby name" , text: $babyName).padding(.leading, 16)
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
            
            Text("Baby Age (Months)")
              .font(
                Font.custom("Inter", size: 16)
                  .weight(.semibold)
              )
              .kerning(0.16)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(width: 317, height: 22, alignment: .leading)
            TextField("Input your baby age" , text: $babyName).padding(.leading, 16)
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
        .padding(.top, 16)
        .padding(.horizontal, 16)
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Baby Age (Months)")
              .font(
                Font.custom("Inter", size: 16)
                  .weight(.semibold)
              )
              .kerning(0.16)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(width: 317, height: 22, alignment: .leading)
            TextField("Input your baby age" , text: $babyName).padding(.leading, 16)
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
        .padding(.top, 16)
        .padding(.horizontal, 16)
        
        
        
        Spacer()
        
    }
}

#Preview {
    EditProfileView()
}
