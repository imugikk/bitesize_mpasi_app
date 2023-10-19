//
//  MenuView.swift
//  bitesize
//
//  Created by Michelle Annice on 23/10/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView{
            VStack{
                Spacer().frame(height: 46)
                
                Text("My Menu")
                    .font(
                        Font.custom("Nunito", size: 32)
                            .weight(.semibold)
                    )
                    .kerning(0.32)
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                
                    .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 358.00003, height: 0.33)
                  .background(Color(red: 0.38, green: 0.39, blue: 0.42))
            }
        }
    }
}

#Preview {
    MenuView()
}
