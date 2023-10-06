//
//  ContentView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State private var babies: [Babies] = []
    
    //    var baby: Babies = Babies(name: "Ratna Sari Putra Reggae", gender: "Female", dob: Date(), weight: 65.4, height: 175.2, hc: 43.8, userId: "user_1")
    
    @State private var name = ""
    @State private var gender = ""
    @State private var dob = Date.now
    
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                TextField("Name", text: $name)
                TextField("Gender", text: $gender)
                DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date){
                    Text("Date of Birth")
                }
                
                Spacer()
                HStack{
                    Button("Skip"){
                        //                        let zscorecalculate = zscore.calculateZScore(month: 5, weight: 8.0, height:72.0)
                        //
                        //                        let zScoreData = ZScoreResult(zScore: zscorecalculate!)
                        //
                        //                        firestoreManager.createZScore(zscore: zScoreData)
                        
                        print(zscore.statusZscoreHeight(zscore: 2.5).rawValue)
                        print(zscore.statusZscoreWeight(zscore: -3.5).rawValue)
                        
                        var weight: Double?
                        var dob: Date?
                        var caloriesNeeded: Double? // Define caloriesNeeded at a higher scope
                        
                        if let baby = babies.first {
                            weight = baby.weight
                            dob = baby.dob
                            
                            print("Weight: \(weight ?? 0.0)")
                            print("Date of Birth: \(dob ?? Date())")
                            
                            if let weight = weight, let dob = dob {
                                caloriesNeeded = calculator.calculateCaloriesNeeded(dob: dob, weight: weight)
                            } else {
                                print("Weight or date of birth is not available.")
                            }
                        } else {
                            print("Baby data not available.")
                        }
                        
                        if let caloriesNeeded = caloriesNeeded {
                            let caloriesResult = CaloriesNeededResult(caloriesNeeded: caloriesNeeded)
                            
                            // Now you can pass caloriesResult to Firestore
                            firestoreManager.createCaloriesNeeded(caloriesneeded: caloriesResult)
                        } else {
                            print("Unable to calculate calories needed.")
                        }
                        
                        
                        //                    Text("Weight Z-Score: \(viewModel.weightZScore)")
                        //                    Text("Height Z-Score: \(viewModel.heightZScore)")
                        Spacer()
                        
                        NavigationLink{
                            BabyInputView(name: $name, dob: $dob, gender: $gender)
                        } label: {
                            Text("Next")
                        }.navigationBarBackButtonHidden()
                    }
                }
                .padding()
                .onAppear{
                    firestoreManager.getBabiesData(forUserId: "user_1"){ fetchBabies in
                        self.babies = fetchBabies
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environmentObject(FirestoreManager())
        }
    }
}
