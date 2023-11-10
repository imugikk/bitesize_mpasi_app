//
//  UserProfileCard.swift
//  bitesize
//
//  Created by febriandianto prabowo on 10/11/23.
//

import SwiftUI

struct UserProfileCard: View {
    @State private var user = User.MOCK_USER
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 10) {
            VStack {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 100, height: 100)
                  .background(
                    Image(user.profileImageURL ?? "")
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
            }
            
            VStack {
                Text(user.babyName)
                  .font(
                    Font.custom("Inter", size: 22)
                      .weight(.medium)
                  )
                  .kerning(0.088)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.top, 20)
                  .padding(.leading, 10)
                  .padding(.bottom, 5)
                  
                
                Text("8 Bulan")
                  .font(Font.custom("Inter", size: 14))
                  .kerning(0.08)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.leading, 10)
           
                Text("Perempuan")
                  .font(Font.custom("Inter", size: 14))
                  .kerning(0.08)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.leading, 10)
                  
            }
                VStack{
                    NavigationLink(value: user) {
                        Text("Edit")
                            .kerning(0.4)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                            .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .trailing)
                            .opacity(1)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                        
                    }
                }
            }
           
                
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: 50, minHeight: 30, maxHeight: 30, alignment: .trailing)
                .opacity(1)
            
            
                
        }
       
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .top)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(8)
    }
}

#Preview {
    UserProfileCard()
}
