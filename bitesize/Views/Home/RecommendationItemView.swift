//
//  RecommendationItemView.swift
//  bitesize
//
//  Created by Michelle Annice on 16/10/23.
//

import SwiftUI

struct RecommendationItemView: View {
    
    var menuName: String
    var menuId: String
    var menuAllergy: [String]?
    var menuImage: String?


    init(menuName: String, menuId: String, menuAllergy: [String]?, menuImage: String?) {
        self.menuName = menuName
        self.menuId = menuId
        self.menuAllergy = menuAllergy
        self.menuImage = menuImage
    }
    
    var body: some View {
        ZStack (alignment: .top){
            Rectangle()
                .fill(Color(red: 0.94, green: 0.94, blue: 0.94))
                .frame(width: 174, height: 208)
                .cornerRadius(8)
            
            VStack{
                Spacer().frame(height: 8)
                
                if let menuImage = menuImage {
                    let imageURL = URL(string: menuImage) ?? URL(string: "")
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity, minHeight: 130, maxHeight: 130)
                        .background(
                            AsyncImage(url: imageURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 158, height: 130)
                                    .clipped()
                                    .cornerRadius(8)
                            } placeholder: {
                                //tempat taruh loading gambarnya biar ga cuma kosong doang viewnya
                            }
                        )
                } else {
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
                }
                
                Spacer().frame(height: 8)
                
                HStack{
                    Spacer().frame(width: 8)
                    
                    Text(menuName)
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
                    ForEach(menuAllergy ?? [], id: \.self) { item in
                        AllergyView(allergy: item)
                    }
                }.frame(width: 160, height: 30, alignment: .leading)
            }
        }
    }
}

//#Preview {
//    RecommendationItemView(menuName: "Makanan Pagi", menuId: "1", menuAllergy: ["Nuts", "Egg"])
//}
