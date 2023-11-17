//
//  SummaryResultCard.swift
//  bitesize
//
//  Created by febriandianto prabowo on 16/11/23.
//

import SwiftUI

struct SummaryResultCard: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var isShowingCaloriesSheet = false
    @State private var isShowingCalculationSheet = false
    @State private var isShowingEditSheet = false
    
    @State private var babies: [Babies] = []
    @State private var gizi: [Double] = []
    @State private var menu: [String] = []
    @State private var zScoreView: [Double] = []



    var body: some View {
        let nutrition = babies.first?.nutrition.last ?? 0
        let lowerBoundCarbs = String(format: "%.0f", nutrition * 0.35 / 4)
        let upperBoundCarbs = String(format: "%.0f", nutrition * 0.60 / 4)
        let resultTextCarbs = "\(lowerBoundCarbs)~\(upperBoundCarbs)g"
        
        let lowerBoundFat = String(format: "%.0f", nutrition * 0.30 / 9)
        let upperBoundFat = String(format: "%.0f", nutrition * 0.45 / 9)
        let resultTextFat = "\(lowerBoundFat)~\(upperBoundFat)g"
        
        let lowerBoundProtein = String(format: "%.0f", nutrition * 0.10 / 4)
        let upperBoundProtein = String(format: "%.0f", nutrition * 0.15 / 4)
        let resultTextProtein = "\(lowerBoundProtein)~\(upperBoundProtein)g"
        
        
        
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 24) {
                HStack(alignment: .center, spacing: 56) {
                  
                    Text("\(babies.first?.name ?? "") Needs")
                      .font(
                        Font.custom("Nunito", size: 24)
                          .weight(.semibold)
                      )
                      .kerning(0.24)
                      .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                    
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .center)
            
                HStack(alignment: .center, spacing: 8) {
                  
                    Text(String(format: "%.0f", babies.first?.nutrition.last ?? 0))
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
                      .kerning(0.32)
                      .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .center)
                
                
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
       
            
            
            
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
        .padding(.bottom, 24)
        .frame(width: 358, alignment: .topLeading)
        .background(.white)
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
        
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .center, spacing: 4) {
                    HStack(alignment: .center, spacing: 4) {
                        
                        HStack(alignment: .center, spacing: 0) {
                            
                            Image("carbo")
                            .frame(width: 13.33333, height: 12.14043)
                            
                        }
                        .padding(.horizontal, 1.33333)
                        .padding(.top, 2)
                        .padding(.bottom, 1.85957)
                        .frame(width: 16, height: 16, alignment: .center)
                      
                      
                        TextCarbsFatProteinView(labelText: "Carbs")
                        
                    }
                    .padding(0)
                    .frame(width: 105, alignment: .center)
                    
                    HStack(alignment: .center, spacing: 4) {
                        
                        Text(gizi == [] ? resultTextCarbs : String(format: "%.1f", gizi[0]) + "g")
                          .font(
                            Font.custom("Inter", size: 22)
                              .weight(.medium)
                          )
                          .kerning(0.088)
                    
                    }
                    .padding(0)
                    
                    
                }
                .padding(0)
                .frame(maxWidth: 80, maxHeight: 50, alignment: .center)
                
                
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(.white)
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
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .center, spacing: 4) {
                        HStack(alignment: .center, spacing: 4) {
                            HStack(alignment: .center, spacing: 0) {
                                Image("fat")
                                .frame(width: 13.33333, height: 13.14797)
                                
                            }
                            .padding(.horizontal, 1.33333)
                            .padding(.top, 1.33333)
                            .padding(.bottom, 1.51869)
                            .frame(width: 16, height: 16, alignment: .center)
                            
                       
                            TextCarbsFatProteinView(labelText: "Fat")
                            
                        }
                        .padding(0)
                        .frame(width: 105, alignment: .center)
                        
                        HStack(alignment: .center, spacing: 4) {
                            // HIGH FIDELITY/Title Large
                            Text(gizi == [] ? resultTextCarbs : String(format: "%.1f", gizi[1]) + "g")
                              .font(
                                Font.custom("Inter", size: 22)
                                  .weight(.medium)
                              )
                              .kerning(0.088)
                        }
                        .padding(0)
                        
                    
                    
                    
                    
                }
                .padding(0)
                .frame(maxWidth: 80, maxHeight: 50, alignment: .center)
                
                
                
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(.white)
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
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .center, spacing: 4) {
                    HStack(alignment: .center, spacing: 4) {
                        HStack(alignment: .center, spacing: 0) {
                            Image("protein")
                            .frame(width: 13.33333, height: 13.33333)
                            
                        }
                        .padding(1.33333)
                        .frame(width: 16, height: 16, alignment: .center)
                        
                        TextCarbsFatProteinView(labelText: "Protein")
                        
                    }
                    .padding(0)
                    .frame(width: 105, alignment: .center)
                    
                    HStack(alignment: .center, spacing: 4) {
                        Text(gizi == [] ? resultTextCarbs : String(format: "%.1f", gizi[2]) + "g")
                          .font(
                            Font.custom("Inter", size: 22)
                              .weight(.medium)
                          )
                          .kerning(0.088)
                        
                    }
                    .padding(0)
                }
                .padding(0)
                .frame(maxWidth: 80, maxHeight: 50, alignment: .center)
                
                
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(.white)
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
            
        }
        .padding(0)
        .frame(width: 358, alignment: .topLeading)
        .onAppear{
            firestoreManager.getBabiesData(){ fetchBabies in
                self.babies = fetchBabies
            }
            
            firestoreManager.getGiziBabies(){ fetchGizi in
                self.gizi = fetchGizi
            }
        }
    }
    func didDismiss(){
            
    }
}

#Preview {
    SummaryResultCard()
}
