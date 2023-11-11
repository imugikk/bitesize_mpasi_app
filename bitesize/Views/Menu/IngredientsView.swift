//
//  IngredientsView.swift
//  bitesize
//
//  Created by Michelle Annice on 06/11/23.
//

import SwiftUI

struct IngredientsView: View {
    
    var bahan: [String : [String : String]]
    
    var body: some View {
//        ScrollView{
//            VStack{
//                Text("Ingredients")
//                .font(
//                Font.custom("Nunito", size: 24)
//                .weight(.semibold)
//                )
//                .kerning(0.24)
//                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//
//                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
//                .padding(.horizontal, 16)
//                .padding(.bottom, 8)
//                
//                HStack{
//                    HStack (alignment: .center, spacing: 8){
//                        Rectangle()
//                            .foregroundColor(.clear)
//                            .frame(width: 30, height: 30)
//                            .background(
//                                Image("bawang")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 30, height: 30)
//                                    .clipped()
//                            )
//                            .cornerRadius(30)
//                        
//                        Text("Shallots")
//                            .font(Font.custom("Inter", size: 14))
//                            .kerning(0.08)
//                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    }
//                    .padding(.trailing, 48)
//                    
//                    HStack (alignment: .center, spacing: 8){
//                        Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 30, height: 30)
//                        .background(
//                        Image("bawang")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 30, height: 30)
//                        .clipped()
//                        )
//                        .cornerRadius(30)
//                        
//                        Text("Shallots")
//                          .font(Font.custom("Inter", size: 14))
//                          .kerning(0.08)
//                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    }
//                }
//                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
//                .padding(.horizontal, 16)
//                
//                HStack{
//                    HStack (alignment: .center, spacing: 8){
//                        Rectangle()
//                            .foregroundColor(.clear)
//                            .frame(width: 30, height: 30)
//                            .background(
//                                Image("bawang")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 30, height: 30)
//                                    .clipped()
//                            )
//                            .cornerRadius(30)
//                        
//                        Text("Shallots")
//                            .font(Font.custom("Inter", size: 14))
//                            .kerning(0.08)
//                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    }
//                    .padding(.trailing, 48)
//                    
//                    HStack (alignment: .center, spacing: 8){
//                        Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 30, height: 30)
//                        .background(
//                        Image("bawang")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 30, height: 30)
//                        .clipped()
//                        )
//                        .cornerRadius(30)
//                        
//                        Text("Shallots")
//                          .font(Font.custom("Inter", size: 14))
//                          .kerning(0.08)
//                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    }
//                }
//                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
//                .padding(.horizontal, 16)
//                
//                HStack{
//                    HStack (alignment: .center, spacing: 8){
//                        Rectangle()
//                            .foregroundColor(.clear)
//                            .frame(width: 30, height: 30)
//                            .background(
//                                Image("bawang")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 30, height: 30)
//                                    .clipped()
//                            )
//                            .cornerRadius(30)
//                        
//                        Text("Shallots")
//                            .font(Font.custom("Inter", size: 14))
//                            .kerning(0.08)
//                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    }
//                    .padding(.trailing, 48)
//                    
//                    HStack (alignment: .center, spacing: 8){
//                        Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 30, height: 30)
//                        .background(
//                        Image("bawang")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 30, height: 30)
//                        .clipped()
//                        )
//                        .cornerRadius(30)
//                        
//                        Text("Shallots")
//                          .font(Font.custom("Inter", size: 14))
//                          .kerning(0.08)
//                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    }
//                }
//                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
//                .padding(.horizontal, 16)
//                
//                HStack{
//                    HStack (alignment: .center, spacing: 8){
//                        Rectangle()
//                            .foregroundColor(.clear)
//                            .frame(width: 30, height: 30)
//                            .background(
//                                Image("bawang")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 30, height: 30)
//                                    .clipped()
//                            )
//                            .cornerRadius(30)
//                        
//                        Text("Shallots")
//                            .font(Font.custom("Inter", size: 14))
//                            .kerning(0.08)
//                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    }
//                    .padding(.trailing, 48)
//                    
//                    HStack (alignment: .center, spacing: 8){
//                        Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(width: 30, height: 30)
//                        .background(
//                        Image("bawang")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 30, height: 30)
//                        .clipped()
//                        )
//                        .cornerRadius(30)
//                        
//                        Text("Shallots")
//                          .font(Font.custom("Inter", size: 14))
//                          .kerning(0.08)
//                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                    }
//                }
//                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
//                .padding(.horizontal, 16)
//            }
//        }
        
        VStack(alignment: .leading){
            ForEach(bahan.sorted(by: { $0.key < $1.key }), id: \.key) { ingredient, properties in
                HStack {
                    Text("\(ingredient) : ")
                        .font(.headline)
                    
                    ForEach(properties.sorted(by: { $0.key < $1.key }), id: \.key) { property, value in
                        Text(value)
                    }
                }
            }
        }
    }
}

//#Preview {
//    IngredientsView()
//}
