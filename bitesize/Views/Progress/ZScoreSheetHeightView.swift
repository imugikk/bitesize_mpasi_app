//
//  ZScoreSheetHeightView.swift
//  bitesize
//
//  Created by Michelle Annice on 10/11/23.
//

import SwiftUI

struct ZScoreSheetHeightView: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var babies: [Babies] = []
    @State private var menu: [String] = []
    @State private var zScoreView: [Double] = []
    
    var body: some View {
        VStack (alignment: .center){
            HStack{
                Text("Z-Score")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .padding(.bottom, 20)
            }
            .padding(0)
            .frame(width: 390, height: 42, alignment: .center)
            
            VStack(alignment: .center, spacing: 12) {
                
                Text("\(babies.first?.name ?? "")’s Height is considered")
                  .font(
                    Font.custom("Inter", size: 12)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .leading)
                
                Text(zscore.statusZscoreHeight(zscore: babies.first?.zscore[1] ?? 0).rawValue)
                    .font(
                      Font.custom("Nunito", size: 32)
                        .weight(.semibold)
                    )
                    .kerning(0.32)
                    .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                    .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
            }
            .padding(16)
            .frame(width: 358, height: 87, alignment: .center)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(8)
            .padding(.bottom, 16)
            
            VStack(alignment: .center, spacing: 8) {
                
                Text("WHO Standard")
                  .font(
                    Font.custom("Inter", size: 16)
                      .weight(.semibold)
                  )
                  .kerning(0.16)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("ZScore")
                
                
            }
            .padding(12)
            .frame(width: 358, alignment: .center)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(8)
            .padding(.bottom, 16)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center) {
                    Text("Kategori Status Gizi")
                      .font(
                        Font.custom("Inter", size: 16)
                          .weight(.semibold)
                      )
                      .kerning(0.16)
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  Spacer()
                  
                    Text("Z Score")
                      .font(
                        Font.custom("Inter", size: 16)
                          .weight(.semibold)
                      )
                      .kerning(0.16)
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                }
                .padding(0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                Divider()
                
                HStack{
                    Text("Sangat Pendek")
                    .font(Font.custom("Inter", size: 12))
                    .kerning(0.2)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))

                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("< -3 SD")
                    .font(Font.custom("Inter", size: 12))
                    .kerning(0.2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                }
                
                HStack{
                    Text("Pendek")
                    .font(Font.custom("Inter", size: 12))
                    .kerning(0.2)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 155 , alignment: .leading)
                    
                    Text("-3 SD sampai dengan < -2 SD")
                    .font(Font.custom("Inter", size: 12))
                    .kerning(0.2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                }
                
                HStack{
                    Text("Normal")
                    .font(Font.custom("Inter", size: 12))
                    .kerning(0.2)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(maxWidth: .infinity , alignment: .leading)
                    
                    Text("-2 SD sampai dengan +1 SD")
                    .font(Font.custom("Inter", size: 12))
                    .kerning(0.2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                }
                
                HStack{
                    Text("Tinggi")
                    .font(Font.custom("Inter", size: 12))
                    .kerning(0.2)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(maxWidth: .infinity , alignment: .leading)
                    
                    Text("> +1 SD")
                    .font(Font.custom("Inter", size: 12))
                    .kerning(0.2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                }

            }
            .padding(16)
            .frame(maxWidth: .infinity, minHeight: 178, maxHeight: 178, alignment: .topLeading)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(8)
            .padding(.horizontal, 16)
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
            .onAppear{
                firestoreManager.getBabiesData(){ fetchBabies in
                    self.babies = fetchBabies
                }
                
                firestoreManager.getMenuRecommendation() { fetchMenu in
                    self.menu = fetchMenu
                }
            }
    }
}

//#Preview {
//    ZScoreSheetHeightView()
//}
