//
//  RecommendationItemView.swift
//  bitesize
//
//  Created by Michelle Annice on 16/10/23.
//

import SwiftUI

struct RecommendationItemView: View {
    
    let name: String

    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        ZStack (alignment: .top){
            Rectangle()
                .fill(Color(red: 0.94, green: 0.94, blue: 0.94))
                .frame(width: 174, height: 208)
                .cornerRadius(8)
            
            VStack{
                Spacer().frame(height: 8)
                
                Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: .infinity, minHeight: 130, maxHeight: 130)
                .background(
                    Image("pasta")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 158, height: 130)
                        .clipped()
                        .cornerRadius(8)
                )
                
                Spacer().frame(height: 8)
                
                HStack{
                    Spacer().frame(width: 8)
                    
                    Text(name)
                        .font(
                            Font.custom("Inter", size: 16)
                                .weight(.semibold)
                        )
                        .kerning(0.16)
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        .frame(width: 132, height: 16, alignment: .leading)
                    
                    Image(systemName: "bookmark")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    
                    Spacer().frame(width: 8)
                }
                
                HStack (spacing: 2){
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
                }
            }
        }
    }
}

#Preview {
    RecommendationItemView(name: "Makanan Pagi")
}
