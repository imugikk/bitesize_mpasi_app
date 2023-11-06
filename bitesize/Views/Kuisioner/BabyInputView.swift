//
//  BabyInput.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 27/09/23.
//

import SwiftUI

struct BabyInputView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let nutrition = CaloriesNeededCalculator()
    @State private var zscoreResult: [Double] = []
    @State private var nutritionResult: Double = 0.0
    
    @Binding var name: String
    @Binding var dob: Date
    @Binding var gender: String
    @State private var weight: Double = 0.0
    @State private var height: Double = 0.0
    @State private var hc: Double = 0.0
    @State private var time_measured = Date.now
    
    @State private var isTap: Bool = false
    
    @AppStorage("email") var email: String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                InformationView()
                    .edgesIgnoringSafeArea(.horizontal)
                
                VStack(alignment: .leading){
                
                    VStack {
                        Text("Weights")
                            .font(
                                Font.custom("Work Sans", size: 16)
                                    .weight(.medium)
                            )
                            .kerning(0.2)
                            .foregroundColor(Color(red: 0.23, green: 0, blue: 0.9))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("weight", value: $weight, format: .number)
                        
                        Text("Heights")
                            .font(
                                Font.custom("Work Sans", size: 16)
                                    .weight(.medium)
                            )
                            .kerning(0.2)
                            .foregroundColor(Color(red: 0.23, green: 0, blue: 0.9))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("weight", value: $height, format: .number)
                        
                        Text("Head")
                            .font(
                                Font.custom("Work Sans", size: 16)
                                    .weight(.medium)
                            )
                            .kerning(0.2)
                            .foregroundColor(Color(red: 0.23, green: 0, blue: 0.9))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("weight", value: $hc, format: .number)
                        
                        DatePicker(selection: $time_measured, in: ...Date.now, displayedComponents: .date){
                            Text("Time Measured")
                                .font(
                                    Font.custom("Work Sans", size: 16)
                                        .weight(.medium)
                                )
                                .kerning(0.2)
                                .foregroundColor(Color(red: 0.23, green: 0, blue: 0.9))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }.padding(.horizontal, 16)
                    
                    Spacer()
                    
                    HStack{
                        
                        Button(action: {
                            
                        }){
                            Text("Skip")
                                .font(
                                    Font.custom("Work Sans", size: 12)
                                        .weight(.medium)
                                )
                                .kerning(0.6)
                                .foregroundColor(Color(red: 0.23, green: 0, blue: 0.9))
                        }
                        
                        Spacer()
                        
                        
                        Button{
                            let diffs = Calendar.current.dateComponents([.month], from: self.dob, to: Date.now)

                            zscoreResult = zscore.calculateZScore(month: diffs.month ?? 0, weight: self.weight, height: self.height, head: self.hc) ?? []
                            
                            nutritionResult = nutrition.calculateCaloriesNeeded(dob: self.dob, weight: self.weight) ?? 0.0
                            
                            let babyData = Babies(name: self.name, gender: self.gender, dob: self.dob, weight: self.weight, height: self.height, hc: self.hc, userEmail: email, zscore: zscoreResult, nutrition: nutritionResult, timeMeasure: self.time_measured)
                            
                            firestoreManager.createBaby(baby: babyData)
                            
                            isTap = true
                        } label: {
                            Text("Next")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .frame(width: 148, alignment: .center)
                                .background(Color(red: 0.23, green: 0, blue: 0.9))
                                .cornerRadius(8)
                                .font(
                                Font.custom("Work Sans", size: 12)
                                .weight(.medium)
                                )
                                .kerning(0.6)
                                .foregroundColor(Constants.BGWhite)
                        }
                    }
                    .padding(.horizontal, 38)// Left padding
                }
            }
            .navigationDestination(isPresented: $isTap){
                HomeView()
            }
        }.navigationBarBackButtonHidden()
    }
}

struct BabyInputView_Previews: PreviewProvider {
    static var previews: some View {
        BabyInputView(name: .constant("Dea Simalakama"), dob: .constant(Date.now), gender: .constant("Male")).environmentObject(FirestoreManager())
    }
}
