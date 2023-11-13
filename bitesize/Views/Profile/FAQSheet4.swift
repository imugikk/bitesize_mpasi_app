//
//  FAQSheet4.swift
//  bitesize
//
//  Created by febriandianto prabowo on 11/11/23.
//

import SwiftUI

struct FAQSheet4: View {
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    Spacer()
                    
                    HStack {
                        Text("Calculating Calories")
                            .font(.title)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                  Spacer()
                    HStack {
                        Text("The app determines the estimated daily calorie target for weaning based on the baby’s age. The equation result provides the total calorie target for both breastmilk and weaning food. However, the app specifically displays and focuses on the amount of calories needed daily from weaning food.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("Daily Calories Target*")
                            .font(.title2)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                    HStack {
                        Text("4-6 months = (89 x weight [kg] – 100) + 56\n7-12 months = (89 x weight [kg] – 100) + 22\n13-35 months = (89 x weight [kg] – 100) + 20")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("Breastmilk to Weaning Food Ratio**")
                            .font(.title2)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                    HStack {
                        Text("6-8 months = 70% Breastmilk and 30% Weaning Food\n9-11 months = 50% Breastmilk and 50% Weaning Food\n12-24 months = 30% Breastmilk and 70% Weaning Food")
                          .font(Font.custom("Inter-Regular", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("Source:")
                            .font(.subheadline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.5, green: 0.53, blue: 0.53))
                      .frame(width: 358, alignment: .leading)
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("*International Lactation Consultant Association (2013)")
                            .font(.subheadline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.5, green: 0.53, blue: 0.53))
                      .frame(width: 358, alignment: .leading)
                    }
                    HStack {
                        Text("**Ikatan Dokter Anak Indonesia (2017)")
                            .font(.subheadline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.5, green: 0.53, blue: 0.53))
                      .frame(width: 358, alignment: .leading)
                    }

                    
                 
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Calculating Calories")
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
    FAQSheet4()
}
