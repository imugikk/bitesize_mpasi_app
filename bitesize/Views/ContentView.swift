//
//  ContentView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    var baby: Babies = Babies(name: "Ratna Sari Putra Reggae", gender: "Female", dob: Date(), weight: 65.4, height: 175.2, hc: 43.8, userId: "user_1")
    
    
    @State private var name = ""
    @State private var gender = ""
    @State private var dob = Date.now
    
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
                        
                    }
                    Spacer()
                    
                    NavigationLink{
                        BabyInputView(name: $name, dob: $dob, gender: $gender)
                    } label: {
                        Text("Next")
                    }.navigationBarBackButtonHidden()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FirestoreManager())
    }
}
