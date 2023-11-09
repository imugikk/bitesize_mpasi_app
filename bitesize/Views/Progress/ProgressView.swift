//
//  ProgressView.swift
//  bitesize
//
//  Created by Michelle Annice on 01/11/23.
//

import SwiftUI
import Charts

struct ProgressView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var babies: [Babies] = []
    @State private var menu: [String] = []
    @State private var zScoreView: [Double] = []
    
    var body: some View {
        VStack{
            SummaryCardView().frame(width: 358, height: 228)
                .environmentObject(firestoreManager)
            
            HStack(alignment: .center) {
            // Space Between
                Text("Growth")
                .font(
                Font.custom("Nunito", size: 24)
                .weight(.semibold)
                )
                .kerning(0.24)
                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))

                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                
            Spacer()
            // Alternative Views and Spacers
            
                Text("See All")
                .font(
                Font.custom("Inter", size: 14)
                .weight(.medium)
                )
                .kerning(0.4)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))

                .frame(minWidth: 62, maxWidth: 62, maxHeight: .infinity, alignment: .center)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 4)
            .frame(maxWidth: .infinity, alignment: .center)
            
            Chart(babies) { item in

                ForEach(item.weight.indices, id: \.self) {index in
                    LineMark(x: .value("Time Measured", item.timeMeasure[index]), y: .value("Weight", item.weight[index]))
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.defaultDigits))
                }
            }.padding()
            
            Spacer()
        }.onAppear{
            firestoreManager.getBabiesData(){ fetchBabies in
                self.babies = fetchBabies
                print(self.babies)
            }
        }
    }
}

//#Preview {
//    ProgressView()
//}
