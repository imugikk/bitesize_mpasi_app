//
//  FAQSheet2.swift
//  bitesize
//
//  Created by febriandianto prabowo on 11/11/23.
//

import SwiftUI

struct FAQSheet2: View {
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
                            Text("How to Calculate Z-Score?")
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
                            Text("You may be so lucky as to have a program or electronic health record charting system that calculates weight for age z-scores, or standard deviations. You can purchase a program that plots growth and calculates Standard Deviations. There is also a simple web-based calculator that will allow you to calculate z-scores using the child’s gender, age (in months or by birth date and evaluation date), and weight. These calculations use an embedded statistics program and CDC parameters and data. There will be slight differences in SDs among the methods but it doesn’t matter as long as all the figures for a given child come from a single method. Plot the z-scores or SD values against age (a spreadsheet works great) and generate a graph to get a picture of the child’s z-scores over time. If you have SAS statistics program software, after the usual steep learning curve, calculating z-scores is easier. To use your SAS program to calculate weight for age z-scores, download the growth chart data and SAS programming information from the CDC.")
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
                .navigationTitle("Calculate Z-Score")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                                    Text("Close")
                                .font(Font.custom("Inter", size: 16))
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
    FAQSheet2()
}
