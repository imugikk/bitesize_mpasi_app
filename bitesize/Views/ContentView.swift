//
//  ContentView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/09/23.
//

import SwiftUI

enum Gender: CaseIterable{
    case male
    case female
    
    var id: Self { self }
    
    func stringGender() -> String {
        switch (self) {
        case .male:
            return "Male"
        case .female:
            return "Female"
        }
    }
}

struct ContentView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    @State private var selection: Gender = .male
    @State private var name = ""
    @State private var gender = ""
    @State private var dob = Date.now
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                Spacer()
                TextField("Name", text: $name)
                Picker("Select Gender", selection: $selection) {
                    ForEach(Gender.allCases, id: \.self) { option in
                        Text(option.stringGender())
                    }.onChange(of: selection) { newValue in
                        gender = newValue.stringGender()
                    }
                }
                DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date){
                    Text("Date of Birth")
                }
                Spacer()
                HStack{
                    Button {
                        
                    } label: {
                        Text("Skip")
//                        NavigationLink(destination: GraphView()) {
//                            Text("Skip")
//                        }
                        
                    }
                    Spacer()
                    
                    Button {
    
                    } label: {
                        NavigationLink(destination: BabyInputView(name: $name, dob: $dob, gender: $gender)){
                            Text("Next")
                        }
                    }
                }
            }
            .padding()
        }.navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FirestoreManager())
    }
}
