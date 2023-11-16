//
//  ResultView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import SwiftUI

struct ResultView: View {
    @State var showSheetEditData: Bool = false

    var body: some View {
      

        NavigationStack{
            
        Text("Results")
              .font(
                Font.custom("Nunito-SemiBold", size: 32)
                
              )
              .kerning(0.32)
              .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
              .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
              
              .padding(.horizontal, 16)
              .padding(.top, 46)
            
            Divider()
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        

        Text("Below is the nutritions needed for your baby based on the measurement.")
          .font(
            Font.custom("Inter-Medium", size: 16)
           
            )
          .kerning(0.24)
          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 16)
          .padding(.bottom, 8)

        
            
            VStack{
                
                HStack {
                    Image("ResultBanner")
                }
                
                SummaryResultCard()
                
                Button(action: {
                    showSheetEditData.toggle()
                }, label: {
                    HStack(alignment: .center, spacing: 4) {
                        
                        Text("I want to add my own target")
                            .font(
                                Font.custom("Inter-Medium", size: 14)
                                   
                            )
                            .kerning(0.4)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .frame(width: 358, height: 36, alignment: .center)
                    .background(.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.16, green: 0.49, blue: 0.36), lineWidth: 1)
                    )

                    
                })
                .sheet(isPresented: $showSheetEditData, content: {
                    EditDataSheet()
                        .presentationDragIndicator(.visible)
                })
                
                                NavigationLink(destination: HomeView()) {
                    Text("Use this data")
                        .font(
                            Font.custom("Inter-Medium", size: 14)
                                
                        )
                        .kerning(0.4)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.93, green: 0.98, blue: 0.96))
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(width: 358, height: 36, alignment: .center)
                .background(Color(red: 0.18, green: 0.56, blue: 0.42))
                .cornerRadius(8)
                
            }
                
            
            Spacer()
            }.navigationBarHidden(true)
          
               
                
        }
}

//#Preview {
//    ResultView()
//}
