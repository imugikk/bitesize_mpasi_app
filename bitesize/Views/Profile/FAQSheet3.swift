//
//  FAQSheet3.swift
//  bitesize
//
//  Created by febriandianto prabowo on 11/11/23.
//

import SwiftUI

struct FAQSheet3: View {
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    Spacer()
                    HStack {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 390, height: 230)
                        .background(
                        Image("FAQ1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        )
                        .cornerRadius(8)
                    }
                   
                 
                    HStack {
                        Text("What is the importance of Z-Score?")
                            .font(.title)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                    HStack {
                        Text("Sep 2nd 2023")
                            .font(.subheadline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.5, green: 0.53, blue: 0.53))
                      .frame(width: 358, alignment: .leading)
                    }
                    
                  Spacer()
                    HStack {
                        Text("Children who are very large or very small can’t be accurately tracked on the standard growth charts. To understand and assess their growth, their weight needs to be converted to z-scores. Plotting their z-scores against their age gives an accurate picture of their weight patterns.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("Source: Ellyn Satter Institute")
                            .font(.subheadline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.5, green: 0.53, blue: 0.53))
                      .frame(width: 358, alignment: .leading)
                    }
                    .padding(.top, 16)
                 
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Importance of Z-Score")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                                Text("Close")
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
    FAQSheet3()
}
