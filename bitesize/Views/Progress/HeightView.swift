//
//  HeightView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 11/11/23.
//

import SwiftUI

struct HeightView: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var babies: [Babies] = []
    @State private var zScoreView: [Double] = []
    @State private var showingSheet = false
    
    var body: some View {
        
        HStack(){
          
            VStack{
                Text("Initial Data")
                    .font(
                        Font.custom("Inter-Regular", size: 12)
                    )
                    .kerning(0.2)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(alignment: .center)

                Text("(\(babies.first?.timeMeasure.first.map { DateFormatter.localizedString(from: $0, dateStyle: .short, timeStyle: .none) } ?? "Now"))")
                    .font(
                        Font.custom("Inter-Regular", size: 12)
                    )
                    .kerning(0.2)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                Text(String(format: "%.1f", babies.first?.height.first ?? 0) + "cm")
                    .font(
                        Font.custom("Inter-SemiBold", size: 16)
                       
                    )
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    .padding(.top, 8)
            }.padding(16)
            Spacer()
            VStack{
                Text("Lastest Data")
                    .font(
                        Font.custom("Inter-Regular", size: 12)
                    )
                    .kerning(0.2)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(alignment: .center)
                Text("(\(babies.first?.timeMeasure.last.map { DateFormatter.localizedString(from: $0, dateStyle: .short, timeStyle: .none) } ?? "Now"))")
                    .font(
                        Font.custom("Inter-Regular", size: 12)
                    )
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                
                Text(String(format: "%.1f", babies.first?.height.last ?? 0) + "cm")
                    .font(
                        Font.custom("Inter-SemiBold", size: 16)
                        
                    )
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    .padding(.top, 8)
            }.padding(16)
            Spacer()
            VStack{
                Text("Difference")
                    .font(
                        Font.custom("Inter-Regular", size: 12)
                    )
                    .kerning(0.2)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(alignment: .center)
                Text("(\(countDays()))")
                    .font(
                        Font.custom("Inter-Regular", size: 12)
                    )
                    .kerning(0.2)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                Text(String(format: "%.1f", (babies.first?.height.last ?? 0) - (babies.first?.height.first ?? 0)) + "cm")
                    .font(
                        Font.custom("Inter-SemiBold", size: 16)
                        
                    )
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    .padding(.top, 8)
            }.padding(16)
        
        }
        .navigationBarBackButtonHidden()
            .onAppear{
                firestoreManager.getBabiesData(){ fetchBabies in
                    self.babies = fetchBabies
                }
            }
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(8)
        .padding(.horizontal, 16)
        
        HStack(alignment: .center) {
            // Space Between
                Text("Z-Score")
                .font(
                Font.custom("Nunito-SemiBold", size: 24)
                
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
                    Font.custom("Inter-Medium", size: 14)
                   
                    )
                    .kerning(0.4)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                }
                .sheet(isPresented: $showingSheet) {
                    ZScoreSheetHeightView()
                        .presentationDragIndicator(.visible)
                }
            }
        .padding(.horizontal, 16)
        .padding(.top, 24)
        
        HStack{
            
            VStack(alignment: .leading){
                Text("\(babies.first?.name ?? "")'s Z Score:")
                    .font(
                        Font.custom("Inter", size: 12)
                    )
                Text(String(format: "%.2f", babies.first?.zscore[1] ?? 0))
                    .font(
                        Font.custom("Inter", size: 32)
                        .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
            }.padding(16)
            Spacer()
            VStack(alignment: .leading){
                
                let heightDouble: Double = babies.first?.height.last ?? 0.0
                let heightString = String(heightDouble)
                
                Text("Height: \(heightString)")
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
            }.padding(16)
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
//    HeightView()
//}
