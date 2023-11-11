//
//  WeightView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 11/11/23.
//

import SwiftUI

struct WeightView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var babies: [Babies] = []
    @State private var menu: [String] = []
    @State private var zScoreView: [Double] = []
    @State private var showingSheet = false
    
    var body: some View {
        
        HStack(){
            Spacer()
            VStack{
                Text("Initial Data")
                    .font(
                        Font.custom("Inter", size: 12)
                    )
                Text("(\(babies.first?.timeMeasure.first.map { DateFormatter.localizedString(from: $0, dateStyle: .short, timeStyle: .none) } ?? "Now"))")
                    .font(
                        Font.custom("Inter", size: 12)
                    )
                Text(String(format: "%.1f", babies.first?.weight.first ?? 0) + "kg" )
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    .padding(.top, 8)
            }.padding(10)
            
            Spacer()
            
            VStack{
                Text("Lastest Data")
                    .font(
                        Font.custom("Inter", size: 12)
                    )
                Text("(\(babies.first?.timeMeasure.last.map { DateFormatter.localizedString(from: $0, dateStyle: .short, timeStyle: .none) } ?? "Now"))")
                    .font(
                        Font.custom("Inter", size: 12)
                    )
                Text(String(format: "%.1f", babies.first?.weight.last ?? 0) + "kg")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    .padding(.top, 8)
            }.padding(10)
            
            Spacer()
            
            VStack{
                Text("Difference")
                    .font(
                        Font.custom("Inter", size: 12)
                    )
                Text("(\(countDays()))")
                    .font(
                        Font.custom("Inter", size: 12)
                    )
                Text(String(format: "%.1f", (babies.first?.weight.last ?? 0) - (babies.first?.weight.first ?? 0)) + "kg")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    .padding(.top, 8)
            }.padding(10)
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
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(8)
        .padding(.horizontal, 16)
        
        HStack(alignment: .center) {
            // Space Between
            Text("Z Score")
                .font(
                    Font.custom("Nunito", size: 24)
                        .weight(.semibold)
                )
                .kerning(0.24)
                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
            
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
            
            Spacer()
            
            Button {
                showingSheet.toggle()
            } label: {
                Text("Learn More")
                    .font(
                        Font.custom("Inter", size: 14)
                            .weight(.medium)
                    )
                    .kerning(0.4)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
            }
            .sheet(isPresented: $showingSheet) {
                ZScoreSheetView()
                    .presentationDragIndicator(.visible)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
        
        HStack{
            Spacer()
            VStack(alignment: .leading){
                Text("\(babies.first?.name ?? "")'s Z Score:")
                    .font(
                        Font.custom("Inter", size: 12)
                    )
                Text(String(format: "%.2f", babies.first?.zscore[0] ?? 0))
                    .font(
                        Font.custom("Inter", size: 32)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
            }.padding(10)
            Spacer()
            VStack(alignment: .leading){
                let weightDouble: Double = babies.first?.weight.last ?? 0.0
                let weightString = String(weightDouble)
                
                Text("Weight: \(weightString)")
                    .font(
                        Font.custom("Inter", size: 11)
                    ).foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.37))
                    .padding(.top, 0.5)
                
                
                Text("Age: 5 Months")
                    .font(
                        Font.custom("Inter", size: 11)
                    ).foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.37))
                    .padding(.top, 0.5)
                Text("Last Update: 06/06/2023")
                    .font(
                        Font.custom("Inter", size: 11)
                    ).foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.37))
                    .padding(.top, 0.5)
            }.padding(10)
            Spacer()
        }
        
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(8)
        .padding(.horizontal, 16)
        
    }
    
    func countDays() -> String {
        if let firstDate = babies.first?.timeMeasure.first, let lastDate = babies.first?.timeMeasure.last {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day], from: firstDate, to: lastDate)

            if let days = components.day {
                return("\(days) Days")
            }
        } else {
            return ""
        }
        
        return ""
    }
}

//#Preview {
//    WeightView()
//}
