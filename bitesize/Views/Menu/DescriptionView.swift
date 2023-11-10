//
//  DescriptionView.swift
//  bitesize
//
//  Created by Michelle Annice on 06/11/23.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        ScrollView{
            VStack{
                Text("Description")
                .font(
                Font.custom("Nunito", size: 24)
                .weight(.semibold)
                )
                .kerning(0.24)
                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))

                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
//                .padding(.bottom, 8)
                
                Text("It’s hard to beat the homey, comforting goodness of a shepherd’s pie. Our chefs whipped up a vegetarian version that’s just as rich and hearty as the original! Meaty mushrooms (instead of traditional ground beef) are simmered with tomato paste, veggie stock, and a bounty of fresh veggies and thyme. On top, swoops of creamy mashed potatoes are sprinkled with Monterey Jack, then broiled to create an irresistibly cheesy crust.")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(maxWidth: .infinity, minHeight: 253, maxHeight: 253, alignment: .leading)
                  .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    DescriptionView()
}
