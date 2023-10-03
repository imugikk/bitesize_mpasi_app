//
//  BabyInput.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 27/09/23.
//

import SwiftUI

struct BabyInputView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    @Binding var name: String
    @Binding var dob: Date
    @Binding var gender: String
    @State private var weight: Double = 0.0
    @State private var height: Double = 0.0
    @State private var hc: Double = 0.0
    @State private var time_measured = Date.now
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Spacer()
                
                Text("Weight")
                TextField("weight", value: $weight, format: .number)
                Text("Height")
                TextField("weight", value: $height, format: .number)
                Text("Head Circumference")
                TextField("weight", value: $hc, format: .number)
                DatePicker(selection: $time_measured, in: ...Date.now, displayedComponents: .date){
                    Text("Date of Birth")
                }
                
                Spacer()
                
                HStack{
                    Button("Skip"){
                        
                    }
                    Spacer()
                    
                    
                    Button{
                        let babyData = Babies(name: self.name, gender: self.gender, dob: self.dob, weight: self.weight, height: self.height, hc: self.hc, userId: "user_1")
                        firestoreManager.createBaby(baby: babyData)
                    } label: {
                        NavigationLink(destination: SomesView()) {
                            Text("Next")
                        }
                    }
                }
            }.padding()
        }.navigationBarBackButtonHidden()
    }
}

struct BabyInputView_Previews: PreviewProvider {
    static var previews: some View {
        BabyInputView(name: .constant("Dea Simalakama"), dob: .constant(Date.now), gender: .constant("Male")).environmentObject(FirestoreManager())
    }
}
