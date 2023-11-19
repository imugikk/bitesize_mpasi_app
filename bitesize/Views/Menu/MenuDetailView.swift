//
//  MenuDetailView.swift
//  bitesize
//
//  Created by Michelle Annice on 01/11/23.
//

import SwiftUI

struct MenuDetailView: View {
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    @State private var selectedOption = 0
    @State private var selectedSegment: Int = 0
    @State private var detailMenu: Menu?
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    @State private var isBookmarked = false
    
    var menuId: String
//    var menuCalories: Double
    var menuImage: String?

    var body: some View {
        NavigationStack{
            ScrollView {
//                MenuDetailTabView()
//                    .cornerRadius(8)
                
                if let menuImage = menuImage {
                    let imageURL = URL(string: menuImage) ?? URL(string: "")
                    
//                    Rectangle()
//                        .foregroundColor(.clear)
//                        .frame(maxWidth: .infinity, minHeight: 130, maxHeight: 130)
//                        .background(
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
//                            .frame(width: 294, height: 151.51553)
//                            .clipped()
//                            .cornerRadius(8)
                    } placeholder: {
                       Text("Image Loading")
                    }
//                        ).padding(.top, 8)
                }
                
                HStack {
                    Text(detailMenu?.name ?? "")
                        .font(
                            Font.custom("Nunito", size: 28)
                                .weight(.semibold)
                        )
                        .kerning(0.28)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    Text(detailMenu?.jenis[0] ?? "")
                        .font(
                            Font.custom("Inter", size: 16)
                                .weight(.semibold)
                        )
                        .kerning(0.16)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(red: 0.5, green: 0.53, blue: 0.53))
                    
                        .frame(minWidth: 113, maxWidth: 113, maxHeight: .infinity, alignment: .trailing)
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
                .padding(.bottom, 16)
                
                VStack{
                    LazyHStack(spacing: 0) {
                        Button(action: {
                            selectedSegment = 0
                        }) {
                            HStack {
                                Text("Description")
                            }
                            .modifier(TextButtonStyle(selectedSegment: selectedSegment, tag: 0))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            selectedSegment = 1
                        }) {
                            HStack {
                                Text("Ingredients")
                            }
                            .modifier(TextButtonStyle(selectedSegment: selectedSegment, tag: 1))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            selectedSegment = 2
                        }) {
                            HStack {
                                Text("How to Make")
                            }
                            .modifier(TextButtonStyle(selectedSegment: selectedSegment, tag: 2))
                        }
                    }
                    
                    Divider()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                    
                    // Add views based on the selected segment
                    if selectedSegment == 0 {
                        DescriptionView(desc: detailMenu?.desc ?? "", menuCalories: detailMenu?.kalori ?? 0, menuNutrisi: detailMenu?.nutrisi ?? [:])
                    } else if selectedSegment == 1 {
                        IngredientsView(bahan: detailMenu?.bahan ?? [:])
                    } else if selectedSegment == 2 {
                        HowToMakeView(step: detailMenu?.step ?? [])
                    }
                }
                
                
                
            }.onAppear{
                firestoreManager.getDetailMenu(menuId: menuId) { fetchMenu in
                    self.detailMenu = fetchMenu
                }
                
                firestoreManager.isMenuSaved(menuId: menuId) { isSaved in
                    // Update isBookmarked based on the result
                    isBookmarked = isSaved
                }
            }
            
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Menu Detail")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image("BackIcon")
                            .frame(width: 18, height: 24)
                                Text("Cancel")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                        
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                    })
                }
            })
            .toolbar{
                Button{
                    isBookmarked.toggle()
                    
                    if isBookmarked {
                        firestoreManager.savedMenu(menuId: [menuId])
                        print("save")
                    } else {
                        firestoreManager.deleteSavedMenu(menuId: menuId)
                    }
                    
                } label: {
                    HStack(alignment: .center, spacing: 0) {
                        Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                    }
                }
                .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                .padding(.leading, 9)
                .padding(.trailing, 16)
                .padding(.vertical, 9)
                .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .trailing)

            }
          
        }.navigationBarBackButtonHidden()
    }
}

struct TextButtonStyle: ViewModifier {
    var selectedSegment: Int?
    var tag: Int

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .font(Font.custom("Inter", size: 16).weight(.medium))
            .kerning(0.2)
            .multilineTextAlignment(.center)
            .foregroundColor(selectedSegment == tag ? Color.white : Color(red: 0.16, green: 0.49, blue: 0.36))
            .background(selectedSegment == tag ? Color(red: 0.16, green: 0.49, blue: 0.36) : Color.clear)
            .cornerRadius(16)
    }
}


//#Preview {
//    MenuDetailView()
//}


