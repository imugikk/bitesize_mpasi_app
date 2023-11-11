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
    @State private var babies: [Babies] = []
    
    @State private var selection: Gender = .male
    @State private var name = ""
    @State private var gender = ""
    @State private var dob = Date.now
    @State private var weight: Double = 0.0
    
    var body: some View {
        NavigationView{
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
                
                VStack (alignment: .leading){
                    
                    TextView(labelText: "Name")
                        .edgesIgnoringSafeArea(.all)
                    
                    HStack {
                        Spacer(minLength: 16) // Left padding
                        TextField("Input your baby name", text: $name)
                            .padding(12)
                            .frame(width: 360, alignment: .leading)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.69, green: 0.69, blue: 0.71), lineWidth: 1)
                            )
                        Spacer(minLength: 16) // Right padding
                    }.edgesIgnoringSafeArea(.all)
                    
                    TextView(labelText: "Gender")
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    HStack {
                        Spacer(minLength: 16) // Left padding
                                Button(action: {
                                    selection = .male
                                    gender = selection.stringGender()
                                }) {
                                    Text("Male")
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .frame(width: 180, alignment: .center)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.16, green: 0.49, blue: 0.36), lineWidth: 1)
                                        )
                                        .background(selection == .male ? Color(red: 0.18, green: 0.56, blue: 0.42) : Color.white)
                                        .cornerRadius(8)
                                        .font(
                                        Font.custom("Work Sans", size: 12)
                                        .weight(.medium)
                                        )
                                        .kerning(0.6)
                                        .foregroundColor(selection == .male ? Color.white : Color(red: 0.16, green: 0.49, blue: 0.36))
                                }

                                Button(action: {
                                    selection = .female
                                    gender = selection.stringGender()
                                }) {
                                    Text("Female")
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .frame(width: 180, alignment: .center)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.16, green: 0.49, blue: 0.36), lineWidth: 1)
                                        )
                                        .background(selection == .female ? Color(red: 0.18, green: 0.56, blue: 0.42) : Color.white)
                                        .cornerRadius(8)
                                        .font(
                                        Font.custom("Work Sans", size: 12)
                                        .weight(.medium)
                                        )
                                        .kerning(0.6)
                                        .foregroundColor(selection == .female ? Color.white : Color(red: 0.16, green: 0.49, blue: 0.36))
                                }
                        
                        Spacer(minLength: 16) // Right padding
                            }
                    .edgesIgnoringSafeArea(.all)
                    
                    HStack {
                        TextView(labelText: "Date of Birth")
                            .edgesIgnoringSafeArea(.all)
                        
//                        DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date){}
                    }
                    
                    DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date){}
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden() // Hide labels for a cleaner appearance
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                    
                    Text("Weights")
                    .font(
                    Font.custom("Inter", size: 16)
                    .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(.black)

                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    
//                    TextField("weight", value: $weight, format: .number)
                    
                    Picker("", selection: $weight) {
                        ForEach(30..<150, id: \.self) { weight in
                            Text(String(format: "%.1f kg", Double(weight) / 10.0))
                                .tag(Double(weight) / 10.0)
                                }
                            }
                        .pickerStyle(WheelPickerStyle())
//                        .frame(width: 150, height: 150)
                        .clipped()
                        .padding(.horizontal, 40)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    Spacer()
                    
                    HStack{
//                        Button(action: {
//                            
//                        }){
//                            Text("Skip")
//                                .font(
//                                    Font.custom("Work Sans", size: 12)
//                                        .weight(.medium)
//                                )
//                                .kerning(0.6)
//                                .foregroundColor(Color(red: 0.23, green: 0, blue: 0.9))
//                        }
                        
//                        Spacer()
                        
                        Button {
        
                        } label: {
                            NavigationLink(destination: BabyInputView(name: $name, dob: $dob, gender: $gender)){
                                
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
                    }.padding(.horizontal, 16)// Left padding
                }
                
            }
        }.navigationBarBackButtonHidden()
    }
}

struct Constants {
    static let BGWhite: Color = .white
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FirestoreManager())
    }
}
