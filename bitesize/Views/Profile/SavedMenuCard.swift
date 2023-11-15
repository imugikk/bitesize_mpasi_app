//
//  SavedMenuCard.swift
//  bitesize
//
//  Created by febriandianto prabowo on 14/11/23.
//

import SwiftUI

struct SavedMenuCard: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            HStack(alignment: .center, spacing: 0) {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 80, height: 74)
                  .background(
                    Image("ProfileBrianna")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 80, height: 74)
                      .clipped()
                  )
                  .cornerRadius(6)
                
                
                
            }
            
            VStack {
                HStack {
                    Text("Roast Turkey and Gravy")
                      .font(
                        Font.custom("Inter-SemiBold", size: 16)
                          
                      )
                      .kerning(0.16)
                      .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(0)
                .frame(width: 200, height: 8, alignment: .center)
                    Image("SavedIcon")
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                HStack  {
                    Image("CircleAllergySaved")
                    Image("CircleAllergySaved")
                    Image("CircleAllergySaved")
                    Image("CircleAllergySaved")
                    Image("CircleAllergySaved")
                    Spacer()
                    
                }
                .padding(.trailing)
                .padding(.horizontal, 16)
                
            }
            
            
            
            
        }
        .padding(8)
        .frame(width: 358, height: 92, alignment: .leading)
        .background(.white)
        .cornerRadius(8)
    }
}

#Preview {
    SavedMenuCard()
}
