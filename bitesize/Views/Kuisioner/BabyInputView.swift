//
//  BabyInput.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 27/09/23.
//

import SwiftUI

struct BabyInputView: View {
    
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let nutrition = CaloriesNeededCalculator()
    @State private var zscoreResult: [Double] = []
    @State private var nutritionResult: Double = 0.0
    
    @Binding var name: String
    @Binding var dob: Date
    @Binding var gender: String
    @Binding var weight: [Double]
//    @State private var height: Double = 0.0
    @State private var integerPartHeight: Int = 0
    @State private var decimalPartHeight: Int = 0
    
    @State private var integerPartHC: Int = 0
    @State private var decimalPartHC: Int = 0
    
//    @State private var hc: Double = 0.0
    @State private var time_measured = Date.now
    
    @State private var isTap: Bool = false
    
    @AppStorage("email") var email: String = ""
    
    var body: some View {
//        NavigationStack{
            VStack{
                VStack (alignment: .leading){
                    InformationView()
                }
                    .edgesIgnoringSafeArea(.horizontal)
//                    .padding(.top, 46)
                
                VStack(alignment: .leading){
                
                    VStack {
                        TextView(labelText: "Height")
                            .edgesIgnoringSafeArea(.all)
//                        TextField("weight", value: $height, format: .number)
                        
                        HStack {
                            Spacer()
                            Picker("", selection: $integerPartHeight) {
                                ForEach(0..<100) { index in
                                    Text("\(index)")
                                }
                            }
                            .labelsHidden()
                            .frame(width: 80)
                            .clipped()

                            Text(",")

                            Picker("", selection: $decimalPartHeight) {
                                ForEach(0..<10) { index in
                                    Text("\(index)")
                                }
                            }
                            .labelsHidden()
                            .frame(width: 80)
                            .clipped()
                            
                            Text("cm")
                            Spacer()
                        }
                        .pickerStyle(WheelPickerStyle())
                        
                        TextView(labelText: "Head Circumference")
                            .edgesIgnoringSafeArea(.all)
                        
                        HStack {
                            Spacer()
                            Picker("", selection: $integerPartHC) {
                                ForEach(0..<100) { index in
                                    Text("\(index)")
                                }
                            }
                            .labelsHidden()
                            .frame(width: 80)
                            .clipped()

                            Text(",")

                            Picker("", selection: $decimalPartHC) {
                                ForEach(0..<10) { index in
                                    Text("\(index)")
                                }
                            }
                            .labelsHidden()
                            .frame(width: 80)
                            .clipped()
                            
                            Text("cm")
                            Spacer()
                        }
                        .pickerStyle(WheelPickerStyle())
                        
//                        TextField("weight", value: $hc, format: .number)
                        
                        TextView(labelText: "Time Measured")
                            .edgesIgnoringSafeArea(.all)
                        
                        HStack{
                            Spacer()
                            DatePicker(selection: $time_measured, in: ...Date.now, displayedComponents: .date){}
                                .datePickerStyle(WheelDatePickerStyle())
                                .labelsHidden()
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    
                    Button(){
                        
                    } label: {
                        Text("Measure with AR")
                            .padding(.horizontal, 24)
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(12)
                    }.padding(.horizontal, 24)
                        .padding(.top, 30)
                    
                    Button{
                        let diffs = Calendar.current.dateComponents([.month], from: self.dob, to: Date.now)

                        zscoreResult = zscore.calculateZScore(
                            month: diffs.month ?? 0,
                            weight: self.weight.last ?? 0,
                            height: Double(integerPartHeight).addingDecimalPart(decimalPartHeight),
                            head: Double(integerPartHC).addingDecimalPart(decimalPartHC)) ?? []
                        
                        nutritionResult = nutrition.calculateCaloriesNeeded(dob: self.dob, weight: self.weight.last ?? 0) ?? 0.0
                        
                        let babyData = Babies(
                            name: self.name,
                            gender: self.gender,
                            dob: self.dob,
                            weight: self.weight,
                            height: [Double(integerPartHeight).addingDecimalPart(decimalPartHeight)],
                            hc: [Double(integerPartHC).addingDecimalPart(decimalPartHC)],
                            userId: firestoreManager.fetchUserId(),
                            zscore: zscoreResult,
                            nutrition: [nutritionResult],
                            timeMeasure: [self.time_measured])
                        
                        firestoreManager.createBaby(baby: babyData)
                        
                        isTap = true
                    } label: {
                        Text("Next")
                            .padding(.horizontal, 24)
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 50, alignment: .center)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(12)
                    }
                .padding(.horizontal, 24)// Left padding
                }
                .navigationBarBackButtonHidden(false)
             
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image("BackIconBlack")
                                .frame(width: 18, height: 24)
                                  
                        })
                    }
                })
            }
            .navigationDestination(isPresented: $isTap){
            LoadingViewMain()
//                HomeView()
            }
            
//        }
            .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BabyInputView_Previews: PreviewProvider {
    static var previews: some View {
        BabyInputView(name: .constant("Dea Simalakama"), dob: .constant(Date.now), gender: .constant("Male"), weight: .constant([20])).environmentObject(FirestoreManager())
    }
}
