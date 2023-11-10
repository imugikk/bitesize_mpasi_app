//
//  MealItemView.swift
//  bitesize
//
//  Created by Michelle Annice on 30/10/23.
//

import SwiftUI

struct MealItemView: View {
    
    let name: String

    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        VStack{
            ZStack (alignment: .top){
                Rectangle()
                    .fill(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .frame(width: 310, height: 230.79)
                    .cornerRadius(8)
                
                VStack (alignment: .leading){
                    Spacer().frame(height: 8)
                    
                    ZStack (alignment: .topLeading){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity, minHeight: 130, maxHeight: 130)
                            .background(
                                Image("pasta")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 294, height: 151.51553)
                                    .clipped()
                                    .cornerRadius(8)
                            ).padding(.top, 8)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("Low Protein")
                                .font(
                                    Font.custom("Inter", size: 12)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 4)
                        .frame(height: 22.08996, alignment: .center)
                        .background(Color(red: 0.69, green: 0.92, blue: 0.83))
                        
                        .cornerRadius(12)
                        .shadow(color: Color(red: 0.18, green: 0.56, blue: 0.42).opacity(0.25), radius: 2, x: 0, y: 0)
                        
                        .padding(.leading, 16)
                        .padding(.top, 4)
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack{
                        Spacer().frame(width: 8)
                        
                        Text(name)
                            .font(
                                Font.custom("Inter", size: 16)
                                    .weight(.semibold)
                            )
                            .kerning(0.16)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        
                        Text("200 ccal")
                            .font(Font.custom("Inter", size: 14))
                            .kerning(0.08)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.37))
                        
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Spacer().frame(width: 8)
                    }.padding(.top, 8)
                    
                    HStack (spacing: 8){
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.blue)
                        
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.blue)
                        
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.blue)
                        
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.blue)
                        
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.blue)
                    }.padding(.horizontal, 10)
                }
                .frame(width: 310, height: 230.79)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .shadow(color: Color(red: 0.08, green: 0.12, blue: 0.12).opacity(0.25), radius: 3, x: 0, y: 0)
        }
    }
}

#Preview {
    MealItemView(name: "Food Name")
}