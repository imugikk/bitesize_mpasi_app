//
//  FAQTabView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 15/11/23.
//

import SwiftUI

struct FAQTabView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 311, height: 182)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(8)
                    
                    HStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 156, height: 174)
                            .background(
                                Image("orang")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 156, height: 174)
                                    .clipped()
                            )
                        
                        VStack{
                            
                            Text("What is Z-Score")
                                .font(
                                    Font.custom("Nunito-SemiBold", size: 28)
                                    
                                )
                                .kerning(0.28)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                .frame(width: 128, alignment: .leading)
                            
                            Text("By Ellyn Satter Institure")
                                .font(Font.custom("Inter-Regular", size: 12))
                                .kerning(0.2)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                .frame(width: 128, alignment: .leading)
                            
                            
                        }
                    }
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 311, height: 182)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(8)
                    
                    HStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 156, height: 174)
                            .background(
                                Image("orang")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 156, height: 174)
                                    .clipped()
                            )
                        
                        VStack{
                            
                            Text("What is Z-Score")
                                .font(
                                    Font.custom("Nunito-SemiBold", size: 28)
                                    
                                )
                                .kerning(0.28)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                .frame(width: 128, alignment: .leading)
                            
                            Text("By Dr. Mei")
                                .font(Font.custom("Inter-Regular", size: 12))
                                .kerning(0.2)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                .frame(width: 128, alignment: .leading)
                            
                            
                        }
                    }
                }
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 311, height: 182)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(8)
                    
                    HStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 156, height: 174)
                            .background(
                                Image("orang")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 156, height: 174)
                                    .clipped()
                            )
                        
                        VStack{
                            
                            Text("What is Z-Score")
                                .font(
                                    Font.custom("Nunito-SemiBold", size: 28)
                                    
                                )
                                .kerning(0.28)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                .frame(width: 128, alignment: .leading)
                            
                            Text("By Dr. Mei")
                                .font(Font.custom("Inter-Regular", size: 12))
                                .kerning(0.2)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                .frame(width: 128, alignment: .leading)
                            
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FAQTabView()
}
