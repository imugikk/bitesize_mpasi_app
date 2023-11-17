//
//  MenuView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/10/23.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    @StateObject var weekStore = WeekStore()
    @State private var menuUtama: [Any] = []
    @State private var cemilan: [Any] = []
    @State private var babies: [Babies] = []
    
    @State private var selectedCards: Set<String> = Set()
    @State private var totalCalories: Double = 0
    
    var body: some View {
        //        NavigationView{
            VStack {
                HStack {
                    Text("My Menu")
                        .font(
                            Font.custom("Nunito-SemiBold", size: 32)
                                
                        )
                        .kerning(0.32)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                        .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.top, 46)
                    Spacer()
                }
                Divider().padding()
                HeaderView()
                
                HStack(alignment: .center, spacing: 8) {
                    Text("Calories Count")
                        .font(
                            Font.custom("Nunito-SemiBold", size: 20)
                                
                        )
                        .kerning(0.24)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                    Text("\(String(format: "%.0f", totalCalories))/\(String(format: "%.0f", babies.first?.nutrition.last ?? 0))")
                        .font(
                            Font.custom("Nunito-Bold", size: 24)
                                
                        )
                        .kerning(0.28)
                        .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    
                    Text("kcal")
                        .font(
                            Font.custom("Nunito-SemiBold", size: 24)
                               
                        )
                        .kerning(0.24)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 4)
                .frame(width: 390, height: 72, alignment: .center)
                .background(Color(red: 0.93, green: 0.98, blue: 0.96))
                
                
                ScrollView{
                    HStack{
                        Text("Meal Entrée")
                            .font(
                                Font.custom("Nunito-SemiBold", size: 24)
                                    
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
                            ForEach(menuUtama.indices, id: \.self) { index in
                                if let menuItem = menuUtama[index] as? [Any]{
                                    MealItemView(menuName: menuItem[0] as! String, menuCalories: (menuItem[1]) as! Double, menuType: menuItem[2] as! [String], menuId: menuItem[3] as! String, menuAllergy: menuItem[4] as! [String]?, menuImage: menuItem[5] as! String?)
                                        .onTapGesture {
                                            handleCardSelection(menuId: menuItem[3] as! String, calories: menuItem[1] as! Double)
                                        }
                                        .shadow(radius: selectedCards.contains(menuItem[3] as! String) ? 5 : 0)
                                }
                            }
                        }
                        
                    }.padding(.horizontal, 16)
                        .frame(height: 250)
                        .scrollIndicators(.hidden)
                
                    HStack{
                        Text("Nourishing Bite")
                            .font(
                                Font.custom("Nunito-SemiBold", size: 24)
                                    
                            )
                            .kerning(0.24)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        
                            .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                            .padding(.horizontal, 16)
                            .padding(.top, 8)
                        
                    }
                   
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(cemilan.indices, id: \.self) { index in
                                if let menuItem = cemilan[index] as? [Any]{
                                    MealItemView(menuName: menuItem[0] as! String, menuCalories: (menuItem[1]) as! Double, menuType: menuItem[2] as! [String], menuId: menuItem[3] as! String, menuAllergy: menuItem[4] as! [String]?, menuImage: menuItem[5] as! String?)
                                        .onTapGesture {
                                            handleCardSelection(menuId: menuItem[3] as! String, calories: menuItem[1] as! Double)
                                        }
                                        .shadow(radius: selectedCards.contains(menuItem[3] as! String) ? 5 : 0)
                                }
                            }
                        }
                    }.padding(.horizontal, 16)
                        .frame(height: 250)
                        .scrollIndicators(.hidden)
                        
                        .padding(.top, 8)
                        
                    
//                    HStack(alignment: .center, spacing: 86) {
//                        Button(action: {}){
//                            HStack(alignment: .top, spacing: 4) {
//                                Text("Purchase Meal")
//                                    .font(
//                                        Font.custom("Inter", size: 14)
//                                            .weight(.medium)
//                                    )
//                                    .kerning(0.4)
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(Color(red: 0.93, green: 0.98, blue: 0.96))
//                            }
//                            .padding(.horizontal, 24)
//                            .padding(.vertical, 8)
//                            .frame(width: 357, height: 36, alignment: .top)
//                            .background(Color(red: 0.18, green: 0.56, blue: 0.42))
//                            .cornerRadius(8)
//                        }
//                    }
//                    .padding(.horizontal, 16)
//                    .padding(.vertical, 0)
//                    .frame(width: 389, height: 56, alignment: .center)
//                    .background(.white)
//                    .cornerRadius(8)
//                    .shadow(color: Color(red: 0.08, green: 0.12, blue: 0.12).opacity(0.05), radius: 2.5, x: 0, y: -3)
                }
            }
            .navigationBarHidden(true)
            .onAppear{
                firestoreManager.getMenuesData() { fetchMenu in
                    self.menuUtama = fetchMenu
                }
                
                firestoreManager.getMenuCemilanData() { fetchMenu in
                    self.cemilan = fetchMenu
                }
                
                firestoreManager.getBabiesData(){ fetchBabies in
                    self.babies = fetchBabies
                }
                
            }
        }
    
    private func handleCardSelection(menuId: String, calories: Double) {
        if selectedCards.contains(menuId) {
            // Deselect card
            selectedCards.remove(menuId)
            totalCalories -= calories
            if totalCalories < 0 {
                totalCalories = 0
            }
        } else {
            // Select card
            selectedCards.insert(menuId)
            totalCalories += calories
        }
    }
}

//#Preview {
//    MenuView()
//}
