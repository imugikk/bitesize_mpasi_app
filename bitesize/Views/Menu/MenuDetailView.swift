//
//  MenuDetailView.swift
//  bitesize
//
//  Created by Michelle Annice on 01/11/23.
//

import SwiftUI

struct MenuDetailView: View {
    @State private var selectedOption = 0
    @State private var selectedSegment: Int?

    var body: some View {
        ScrollView {
            MenuDetailTabView()
                .cornerRadius(8)

            HStack {
                Text("Puree Mushroom")
                .font(
                Font.custom("Nunito", size: 28)
                    .weight(.semibold)
                )
                .kerning(0.28)
                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))

                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                Text("High Protein")
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
                    DescriptionView()
                } else if selectedSegment == 1 {
                    IngredientsView()
                } else if selectedSegment == 2 {
                    HowToMakeView()
                }
            }
            
            
            
        }
        .edgesIgnoringSafeArea(.top)
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


#Preview {
    MenuDetailView()
}


