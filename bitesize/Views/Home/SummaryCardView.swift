//
//  SummaryCardView.swift
//  bitesize
//
//  Created by Michelle Annice on 01/11/23.
//

import SwiftUI

struct SummaryCardView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var babies: [Babies] = []
    @State private var menu: [String] = []
    @State private var zScoreView: [Double] = []
    
    var body: some View {
        let nutrition = babies.first?.nutrition ?? 0.0
        let lowerBoundCarbs = String(format: "%.1f", nutrition * 0.35 / 4)
        let upperBoundCarbs = String(format: "%.1f", nutrition * 0.60 / 4)
        let resultTextCarbs = "\(lowerBoundCarbs)~\(upperBoundCarbs)g"
        
        let lowerBoundFat = String(format: "%.1f", nutrition * 0.30 / 9)
        let upperBoundFat = String(format: "%.1f", nutrition * 0.45 / 9)
        let resultTextFat = "\(lowerBoundFat)~\(upperBoundFat)g"
        
        let lowerBoundProtein = String(format: "%.1f", nutrition * 0.10 / 4)
        let upperBoundProtein = String(format: "%.1f", nutrition * 0.15 / 4)
        let resultTextProtein = "\(lowerBoundProtein)~\(upperBoundProtein)g"
        
                        //Target Card View
                        VStack(alignment: .center) {
                            HStack (alignment: .center, spacing: 56){
                                Text("\(babies.first?.name ?? "") Needs")
                                    .font(
                                        Font.custom("Nunito", size: 24)
                                            .weight(.semibold)
                                    )
                                    .kerning(0.24)
                                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 16)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            HStack{
                                Text(String(format: "%.2f", babies.first?.nutrition ?? 0))
                                    .font(
                                        Font.custom("Nunito", size: 48)
                                            .weight(.bold)
                                    )
                                    .kerning(0.48)
                                    .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                                
                                Text("ccal/day")
                                    .font(
                                        Font.custom("Nunito", size: 32)
                                            .weight(.semibold)
                                    )
                                    .frame(width: 120, height: 40, alignment: .center)
                                    .kerning(0.32)
                                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                
                                Image(systemName: "info.circle")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                
                            }
                            .frame(width: 326, height: 56, alignment: .center)
                            
                            Spacer().frame(height: 16)
                            
                            HStack{
                                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                                    HStack (alignment: .center, spacing: 4){
                                        Image(systemName: "bell")
                                            .font(.system(size: 24))
                                            .foregroundColor(.green)
                                        
                                        TextCarbsFatProteinView(labelText: "Carbs")
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    
                                    .padding(.leading, 16)
                                    
                                    HStack (alignment: .center, spacing: 2.97933){
                                        Text(resultTextCarbs)
                                            .font(Font.custom("Inter", size: 12))
                                            .kerning(0.2)
                                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    .padding(.top, 1)
                                    
                                    .padding(.leading, 16)
                                }
                                
                                Spacer()
                                
                                VStack{
                                    HStack (alignment: .center, spacing: 4){
                                        Image(systemName: "bell")
                                            .font(.system(size: 24))
                                            .foregroundColor(.green)
                                        
                                        TextCarbsFatProteinView(labelText: "Fat")
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    
                                    HStack (alignment: .center, spacing: 2.97933){
                                        Text(resultTextFat)
                                            .font(Font.custom("Inter", size: 12))
                                            .kerning(0.2)
                                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    .padding(.top, 1)
                                }
                                
                                Spacer()
                                
                                VStack{
                                    HStack (alignment: .center, spacing: 4){
                                        Image(systemName: "bell")
                                            .font(.system(size: 24))
                                            .foregroundColor(.green)
                                        
                                        TextCarbsFatProteinView(labelText: "Protein")
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    
                                    .padding(.trailing, 16)
                                    
                                    HStack (alignment: .center, spacing: 2.97933){
                                        Text(resultTextProtein)
                                            .font(Font.custom("Inter", size: 12))
                                            .kerning(0.2)
                                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    .padding(.top, 1)
                                    
                                    .padding(.trailing, 16)
                                }
                            }
                            
                            Spacer().frame(height: 16)
                            
                            HStack (alignment: .center, spacing: 4){
                                Image(systemName: "info.circle")
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)
                                
                                Text("Find out how we do the calculations.")
                                    .font(Font.custom("Inter", size: 11))
                                    .kerning(0.5)
                                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                
                                Text("Learn more here.")
                                    .font(Font.custom("Inter", size: 11))
                                    .kerning(0.5)
                                    .underline()
                                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                                    .bold()
                            }
                        }.onAppear{
                                firestoreManager.getBabiesData(){ fetchBabies in
                                    self.babies = fetchBabies
                                }
                        }
                        
                        .padding(.vertical, 24.43835)
                        .frame(maxWidth: .infinity, minHeight: 223, maxHeight: 223, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 1)
                                .stroke(
                                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.25, green: 0.8, blue: 0.59), Color(red: 0.93, green: 0.98, blue: 0.96)]), startPoint: .top, endPoint: .bottom),
                                    lineWidth: 2
                                )
                        )
                        .shadow(color: Color(red: 0.18, green: 0.56, blue: 0.42).opacity(0.20), radius: 2, x: 0, y: 0)
                        
                        .padding(.horizontal, 16)
                    }
                }
                
//#Preview {
//    SummaryCardView()
//}
