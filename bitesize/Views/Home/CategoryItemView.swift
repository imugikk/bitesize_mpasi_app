//
//  CategoryItemView.swift
//  bitesize
//
//  Created by Michelle Annice on 19/10/23.
//

import SwiftUI

struct CategoryItemView: View {
    var body: some View {
        ZStack (alignment: .bottom){
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 300, height: 200)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: .black.opacity(0), location: 0.58),
                            Gradient.Stop(color: .black.opacity(0.2), location: 0.75),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                )
                .background(.black.opacity(0.2))
            
                .background(
                    Image("category")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 200)
                        .clipped()
                )
                .cornerRadius(8)
            
            Text("High Protein")
            .font(
            Font.custom("Nunito", size: 40)
            .weight(.bold)
            )
            .foregroundColor(.white)
            
            .padding(.vertical, 17)
        }
    }
}

#Preview {
    CategoryItemView()
}
