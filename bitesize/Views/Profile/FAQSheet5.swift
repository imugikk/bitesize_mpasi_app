//
//  FAQSheet5.swift
//  bitesize
//
//  Created by febriandianto prabowo on 11/11/23.
//

import SwiftUI

struct FAQSheet5: View {
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
       NavigationStack {
            ScrollView{
                VStack {
                    Spacer()
                    
                    HStack {
                        Text("Calculating Nutrients")
                            .font(.title)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                  Spacer()
                    HStack {
                        Text("As baby grows, breast milk alone starts to fall short of providing sufficient nutritional requirements. This is where introducing weaning foods help bridge the gaps. Quality balanced diet, consisting of a combination of carbohydrates, proteins, and fats, is critical to provide energy for activity, growth, and normal development support of the baby.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("By providing a balance macronutrients intake through a diverse nutritious diet, parents can ensure their baby aim for optimal growth and development.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("Carbohydrates")
                            .font(.title2)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                    HStack {
                        Text("35%~60% from Daily Calories for Weaning Food. ")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 10)
                    
                    HStack {
                        Text("Serve as the main source of energy, providing fuel for daily activities and growth.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 10)
                    
                    HStack {
                        Text("Fats")
                            .font(.title2)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                    HStack {
                        Text("35%~45% from Daily Calories for Weaning Food. ")
                          .font(Font.custom("Inter-Regular", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    
                        
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("Play a vital role in brain development, providing insulation and protection for organs, and aiding in fat-soluble vitamins absorption.")
                          .font(Font.custom("Inter-Regular", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 10)
                    
                    HStack {
                        Text("Protein")
                            .font(.title2)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                    HStack {
                        Text("10%~15% from Daily Calories for Weaning Food. ")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    
                        
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("Essential for building and repairing body tissues. Also crucial for supporting muscles, bones, and organs development.")
                          .font(Font.custom("Inter-Regular", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                        
                    }
                    .padding(.top, 10)
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
            .navigationTitle("Calculating Nutrients")
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
            
        }    }
}

#Preview {
    FAQSheet5()
}
