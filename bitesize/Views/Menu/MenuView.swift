//
//  MenuView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/10/23.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State private var menu: [String] = []
    
    var body: some View {
        //        NavigationView{
            VStack {
                HStack {
                    Text("My Menu")
                        .font(
                            Font.custom("Nunito", size: 32)
                                .weight(.semibold)
                        )
                        .kerning(0.32)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                        .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                        .padding(.horizontal, 16)
                    Spacer()
                }
                Divider().padding()
                HeaderView()
                
                HStack(alignment: .center, spacing: 8) {
                    Text("Calories Count")
                        .font(
                            Font.custom("Nunito", size: 24)
                                .weight(.semibold)
                        )
                        .kerning(0.24)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                    Text("210/200")
                        .font(
                            Font.custom("Nunito", size: 28)
                                .weight(.bold)
                        )
                        .kerning(0.28)
                        .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    
                    Text("kcal")
                        .font(
                            Font.custom("Nunito", size: 24)
                                .weight(.semibold)
                        )
                        .kerning(0.24)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .frame(width: 390, height: 72, alignment: .center)
                .background(Color(red: 0.93, green: 0.98, blue: 0.96))
                
                
                ScrollView{
                    HStack{
                        Text("Meal Entrée")
                            .font(
                                Font.custom("Nunito", size: 24)
                                    .weight(.semibold)
                            )
                            .kerning(0.24)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        
                            .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                            .padding(.bottom, 4)
                            .padding(.horizontal, 16)
                            .padding(.top, 8)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(menu, id: \.self) { menuItem in
                                MealItemView(name: menuItem)
                            }
                        }
                    }.padding(.horizontal, 16)
                    
                    
                    HStack{
                        Text("Nourishing Bite")
                            .font(
                                Font.custom("Nunito", size: 24)
                                    .weight(.semibold)
                            )
                            .kerning(0.24)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        
                            .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                            .padding(.horizontal, 16)
                            .padding(.top, 8)
                        
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(menu, id: \.self) { menuItem in
                                MealItemView(name: menuItem)
                            }
                        }
                    }.padding(.horizontal, 16)
                        .padding(.top, 8)
                    
                    
                    HStack(alignment: .center, spacing: 86) {
                        Button(action: {}){
                            HStack(alignment: .top, spacing: 4) {
                                Text("Purchase Meal")
                                    .font(
                                        Font.custom("Inter", size: 14)
                                            .weight(.medium)
                                    )
                                    .kerning(0.4)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.93, green: 0.98, blue: 0.96))
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                            .frame(width: 357, height: 36, alignment: .top)
                            .background(Color(red: 0.18, green: 0.56, blue: 0.42))
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 0)
                    .frame(width: 389, height: 56, alignment: .center)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(color: Color(red: 0.08, green: 0.12, blue: 0.12).opacity(0.05), radius: 2.5, x: 0, y: -3)
                }
            }
            .navigationBarBackButtonHidden()
            .onAppear{
                firestoreManager.getMenuRecommendation() { fetchMenu in
                    self.menu = fetchMenu
                }
            }
        }
}

//#Preview {
//    MenuView()
//}
