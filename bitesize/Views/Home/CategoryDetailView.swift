//
//  CategoryDetailView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 13/11/23.
//

import SwiftUI

struct CategoryDetailView: View {
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    @State private var menu: [Any] = []
    @State var title: String
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(
                        Font.custom("Inter", size: 22)
                        .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    ForEach(menu.indices, id: \.self) { index in
                        if let menuItem = menu[index] as? [Any] {
                            RecommendationItemView(menuName: menuItem[0] as! String, menuId: menuItem[3] as! String, menuAllergy: menuItem[4] as! [String]?, menuImage: menuItem[5] as! String?)
                        }
                    }
                }
                .onAppear{
                    if title == "High Protein" {
                        firestoreManager.getCategoryMenu(jenis: "Tinggi Protein") { fetchMenu in
                            self.menu = fetchMenu
                        }
                    } else if title == "High Fat" {
                        firestoreManager.getCategoryMenu(jenis: "Tinggi Lemak") { fetchMenu in
                            self.menu = fetchMenu
                        }
                    } else if title == "High Carbs" {
                        firestoreManager.getCategoryMenu(jenis: "Tinggi Karbo") { fetchMenu in
                            self.menu = fetchMenu
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Category")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                                Text("Cancel")
                            .font(Font.custom("Inter-Regular", size: 16))
                            .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                    })
                }
            })
            .navigationBarTitleDisplayMode(.inline)
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    CategoryDetailView(title: "")
}
