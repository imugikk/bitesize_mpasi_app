//
//  MenuView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/10/23.
//

import SwiftUI

struct MenuView: View {
    
//    @EnvironmentObject var firestoreManager: FirestoreManager
//    @State private var menu: [String] = []
    
    var body: some View {
//        NavigationView{
            VStack {
                HStack {
                    Text("My Menu")
                        .padding(.horizontal, 16)
                    Spacer()
                }
                Divider().padding()
                HeaderView()
                Text("Calories Count 210 / 200 kcal")
                    .bold()
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 72)
                    .background(Color(.primaryLight))
                ScrollView{
                    HStack{
                        Text("Meal Entrée")
                            .padding()
                        Spacer()
                    }
                    Divider().padding(.horizontal, 16)
//                    ScrollView(.horizontal) {
//                        HStack(spacing: 20) {
//                            ForEach(menu, id: \.self) { menuItem in
//                                RecommendationItemView(name: menuItem)
//                            }
//                        }
//                    }.padding(.horizontal, 16)
                    
                    Spacer()
                }
            }
        }
//        .navigationBarBackButtonHidden()
//            .onAppear{
//                firestoreManager.getMenuRecommendation() { fetchMenu in
//                    self.menu = fetchMenu
//                }
//            }
//    }
}

#Preview {
    MenuView()
}
