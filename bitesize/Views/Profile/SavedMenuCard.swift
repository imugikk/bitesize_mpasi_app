//
//  SavedMenuCard.swift
//  bitesize
//
//  Created by febriandianto prabowo on 14/11/23.
//

import SwiftUI

struct SavedMenuCard: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State private var menu: [Any] = []
    
    var body: some View {
        VStack{
            ForEach(menu.indices, id: \.self) { item in
                if let menuItem = menu[item] as? [Any] {
                    VStack{
                        HStack(alignment: .center, spacing: 16) {
                            HStack(alignment: .center, spacing: 0) {
                                
                                if let menuImage = menuItem[5] as? String {
                                    let imageURL = URL(string: menuImage ) ?? URL(string: "")
                                    
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 80, height: 74)
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
                                        .cornerRadius(6)
                                }
                        
                            }
                            
                            VStack {
                                HStack {
                                    Text(menuItem[1] as! String)
                                      .font(
                                        Font.custom("Inter-SemiBold", size: 16)
                                          
                                      )
                                      .kerning(0.16)
                                      .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                      .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(0)
                                .frame(width: 200, height: 8, alignment: .center)
                                    Image("SavedIcon")
                                    
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                
                                HStack  {
                                    ForEach(menuItem[6] as? [String] ?? [], id: \.self) { item in
                                        AllergyView(allergy: item)
                                    }
                                    Spacer()
                                    
                                }
                                .padding(.trailing)
                                .padding(.horizontal, 16)
                                
                            }
                            
                            
                            
                            
                        }
                        .padding(8)
                        .frame(width: 358, height: 92, alignment: .leading)
                        .background(.white)
                        .cornerRadius(8)
                    }
                }
            }
            Spacer()
        }
        .onAppear{
            firestoreManager.getSavedMenu{ fetchRequest in
                self.menu = fetchRequest
            }
        }
    }
}

#Preview {
    SavedMenuCard()
}
