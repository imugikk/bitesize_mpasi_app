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
    
    var body: some View {
        NavigationStack{
            VStack {
                
                HStack{
                    Text("Input Baby Data")
                        .font(
                        Font.custom("Inter", size: 22)
                        .weight(.medium)
                        )
                        .kerning(0.088)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))

                        .frame(width: 169, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    InformationView()
                        .edgesIgnoringSafeArea(.horizontal)
                }
                
                VStack(alignment: .leading){
                
                    VStack {
//                        Text("Weights")
//                            .font(
//                                Font.custom("Work Sans", size: 16)
//                                    .weight(.medium)
//                            )
//                            .kerning(0.2)
//                            .foregroundColor(Color(red: 0.23, green: 0, blue: 0.9))
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                        
//                        TextField("weight", value: $weight, format: .number)
                        
                        Text("Heights")
                            .font(
                            Font.custom("Inter", size: 16)
                            .weight(.semibold)
                            )
                            .kerning(0.16)
                            .foregroundColor(.black)

                            .frame(maxWidth: .infinity, alignment: .leading)
//                        TextField("weight", value: $height, format: .number)
                        
                        Picker("", selection: $height) {
                            ForEach(300..<1500, id: \.self) { height in
                                Text(String(format: "%.1f cm", Double(height) / 10.0))
                                    .tag(Double(height) / 10.0)
                                    }
                                }
                            .pickerStyle(WheelPickerStyle())
    //                        .frame(width: 150, height: 150)
                            .clipped()
                            .padding(.horizontal, 40)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("Head Circumference")
                        .font(
                        Font.custom("Inter", size: 16)
                        .weight(.semibold)
                        )
                        .kerning(0.16)
                        .foregroundColor(.black)

                        .frame(maxWidth: .infinity, alignment: .leading)
                        
//                        TextField("weight", value: $hc, format: .number)
                        
                        Picker("", selection: $hc) {
                            ForEach(200..<500, id: \.self) { height in
                                Text(String(format: "%.1f cm", Double(height) / 10.0))
                                    .tag(Double(height) / 10.0)
                                    }
                                }
                            .pickerStyle(WheelPickerStyle())
    //                        .frame(width: 150, height: 150)
                            .clipped()
                            .padding(.horizontal, 40)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("Time Measured")
                        .font(
                        Font.custom("Inter", size: 16)
                        .weight(.semibold)
                        )
                        .kerning(0.16)
                        .foregroundColor(.black)

                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        DatePicker(selection: $time_measured, in: ...Date.now, displayedComponents: .date){}
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden() // Hide labels for a cleaner appearance
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                        
                    }.padding(.horizontal, 16)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        HStack(alignment: .center, spacing: 4) {
                            Image("AR")
                                .frame(width: 11.57155, height: 13.5)
                            
                            Text(" Measure with AR")
                              .font(
                                Font.custom("Inter", size: 14)
                                  .weight(.medium)
                              )
                              .kerning(0.4)
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .frame(width: 358, height: 36, alignment: .center)
                        .background(.white)

                        .cornerRadius(8)
                        .overlay(
                        RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.16, green: 0.49, blue: 0.36), lineWidth: 1)

                        )
                    }
                    .padding(.horizontal, 16)
                    
                    HStack{
                        
                        Button{
                            let diffs = Calendar.current.dateComponents([.month], from: self.dob, to: Date.now)

                            zscoreResult = zscore.calculateZScore(month: diffs.month ?? 0, weight: self.weight, height: self.height, head: self.hc) ?? []
                            
                            nutritionResult = nutrition.calculateCaloriesNeeded(dob: self.dob, weight: self.weight) ?? 0.0
                            
                            let babyData = Babies(name: self.name, gender: self.gender, dob: self.dob, weight: self.weight, height: self.height, hc: self.hc, userId: firestoreManager.fetchUserId(), zscore: zscoreResult, nutrition: nutritionResult, timeMeasure: self.time_measured)
                            
                            firestoreManager.createBaby(baby: babyData)
                            
                            isTap = true
                        } label: {
                            
                            Text("Next")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .frame(width: 358, height: 36 ,alignment: .center)
                                .background(Color(red: 0.18, green: 0.56, blue: 0.42))
                                .cornerRadius(8)
                                .font(
                                Font.custom("Inter", size: 14)
                                .weight(.medium)
                                )
                                .kerning(0.4)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.93, green: 0.98, blue: 0.96))
                        }
                    }
                    .padding(.horizontal, 16)// Left padding
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
