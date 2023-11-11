//
//  HowToMakeView.swift
//  bitesize
//
//  Created by Michelle Annice on 06/11/23.
//

import SwiftUI

struct HowToMakeView: View {
    
    var step: [String]
    
    var body: some View {
        ScrollView{
            VStack{
                Text("How To Make")
                  .font(
                    Font.custom("Nunito", size: 24)
                      .weight(.semibold)
                  )
                  .kerning(0.24)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                  .padding(.horizontal, 16)
                  .padding(.bottom, 8)
                
                ForEach(Array(step.enumerated()), id: \.element) { index, step in
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity, minHeight: 223, maxHeight: 223)
                        .background(
                            Image("recipe")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 358, height: 223)
                                .clipped()
                                .cornerRadius(8)
                        )
                        .cornerRadius(8)
                        .padding(.bottom, 16)
                    
                    HStack{
                        ZStack{
                            Image("Ellipse 33")
                                .frame(width: 40, height: 40)
                                .background(Color(red: 0.16, green: 0.49, blue: 0.36))
                                .cornerRadius(30)
                            
                            Text(String(index + 1))
                                .font(
                                    Font.custom("Inter", size: 22)
                                        .weight(.medium)
                                )
                                .kerning(0.088)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.93, green: 0.98, blue: 0.96))
                                .frame(width: 16, height: 30, alignment: .center)
                        }
                        
                        VStack{
                            Text(step)
                                .font(Font.custom("Inter", size: 12))
                                .kerning(0.2)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                }
            }
        }
//        VStack{
//            ForEach(step, id: \.self) { step in
//                Text(step)
//            }
//        }
    }
}

//#Preview {
//    HowToMakeView()
//}
