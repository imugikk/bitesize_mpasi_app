//
//  DescriptionView.swift
//  bitesize
//
//  Created by Michelle Annice on 06/11/23.
//

import SwiftUI



struct DescriptionView: View {
    
    
    
    var desc: String
    var menuCalories: Double
    
    var body: some View {
        
        ScrollView{
            VStack{
                Text("Description")
                .font(
                Font.custom("Nunito", size: 24)
                .weight(.semibold)
                )
                .kerning(0.24)
                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))

                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
                
                Text(desc)
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .padding(.horizontal, 16)
                  .padding(.bottom, 16)
                
                HStack{
                    VStack{
                        Text("Calories:")
                          .font(
                            Font.custom("Inter", size: 16)
                              .weight(.medium)
                          )
                          .kerning(0.2)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        
                        Text("\(String(format: "%.0f", menuCalories)) ccal")
                          .font(Font.custom("Work Sans", size: 14))
                          .kerning(0.08)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 60, alignment: .center)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Cooking Duration:")
                          .font(
                            Font.custom("Inter", size: 16)
                              .weight(.medium)
                          )
                          .kerning(0.2)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 157, alignment: .center)
                        
                        Text("20 min")
                          .font(Font.custom("Work Sans", size: 14))
                          .kerning(0.08)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 157, alignment: .center)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Difficulty:")
                          .font(
                            Font.custom("Inter", size: 16)
                              .weight(.medium)
                          )
                          .kerning(0.2)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 87, alignment: .center)
                        
                        Text("Medium")
                          .font(Font.custom("Work Sans", size: 14))
                          .kerning(0.08)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 87, alignment: .center)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                
                HStack{
                    VStack (alignment:.center){
                        Text("Fat:")
                          .font(
                            Font.custom("Inter", size: 16)
                              .weight(.medium)
                          )
                          .kerning(0.2)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 60, alignment: .center)
                        
                        Text("2g")
                          .font(Font.custom("Work Sans", size: 14))
                          .kerning(0.08)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 60, alignment: .center)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Carbohydrate:")
                          .font(
                            Font.custom("Inter", size: 16)
                              .weight(.medium)
                          )
                          .kerning(0.2)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 157, alignment: .center)
                        
                        Text("80g")
                          .font(Font.custom("Work Sans", size: 14))
                          .kerning(0.08)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 157, alignment: .center)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Protein:")
                          .font(
                            Font.custom("Inter", size: 16)
                              .weight(.medium)
                          )
                          .kerning(0.2)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 87, alignment: .center)
                        
                        Text("9g")
                          .font(Font.custom("Work Sans", size: 14))
                          .kerning(0.08)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                          .frame(width: 87, alignment: .center)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
        
//        VStack{
//            Text("Description")
//                .font(
//                Font.custom("Nunito", size: 24)
//                .weight(.semibold)
//                )
//                .kerning(0.24)
//                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.horizontal, 16)
//    //                .padding(.bottom, 8)
//                
//                Text(desc)
//                  .font(Font.custom("Inter", size: 16))
//                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//                  .frame(maxWidth: .infinity, minHeight: 253, maxHeight: 253, alignment: .leading)
//                  .padding(.horizontal, 16)
//        }
//    }
}

//#Preview {
//    DescriptionView()
//}
