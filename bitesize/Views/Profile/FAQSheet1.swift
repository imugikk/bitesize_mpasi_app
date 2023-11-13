//
//  FAQSheet1.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 11/11/23.
//

import SwiftUI

struct FAQSheet1: View {
    
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
                            Text("What is Z Score")
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
                            Text("The bell curve on the right illustrates the principle of z-scores. The z-score is the standard deviation (SD) above or below the mean. A z-score of 0 is at the apex of the curve and is the same as a 50th percentile, a z-score of ± 1.0 plots at the 15th or 85th percentiles, respectively, and a z-score of ± 2 plots at roughly the 3rd or 97th percentiles. At birth, Josh’s z-score was at about -3.7, or 3.7 SD below the mean. That is well below the third percentile, but Josh’s was holding his own with weight, and his weight had gradually crept up by about one SD before it was driven back down by pressured feeding.")
                              .font(Font.custom("Inter-Regular", size: 16))
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
                .navigationTitle("What is Z-Score")
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
    FAQSheet1()
}
