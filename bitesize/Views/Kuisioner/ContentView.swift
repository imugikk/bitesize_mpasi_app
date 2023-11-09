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
    
    @State private var integerPart: Int = 0
    @State private var decimalPart: Int = 0
    
    var body: some View {
        NavigationView{
            VStack {
                InformationView()
                    .edgesIgnoringSafeArea(.horizontal)
                
                VStack (alignment: .leading){
                    TextView(labelText: "Name")
                    
                    HStack {
                        Spacer(minLength: 16) // Left padding
                        TextField("Name", text: $name)
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
                    
                    TextView(labelText: "Date of Birth")
                        .edgesIgnoringSafeArea(.all)
                    
                    HStack{
                        Spacer()
                        DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date){}
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                        Spacer()
                    }
                    
                    TextView(labelText: "Weight")
                        .edgesIgnoringSafeArea(.all)
                    
                    HStack {
                        Spacer()
                        Picker("", selection: $integerPart) {
                            ForEach(0..<100) { index in
                                Text("\(index)")
                            }
                        }
                        .labelsHidden()
                        .frame(width: 80)
                        .clipped()

                        Text(",")

                        Picker("", selection: $decimalPart) {
                            ForEach(0..<10) { index in
                                Text("\(index)")
                            }
                        }
                        .labelsHidden()
                        .frame(width: 80)
                        .clipped()
                        
                        Text("kg")
                        Spacer()
                    }
                    .pickerStyle(WheelPickerStyle())
                    
//                    TextField("weight", value: $weight, formatter: numberFormatter)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Spacer()
                    
                    Button {
    
                    } label: {
                        NavigationLink(destination: BabyInputView(
                            name: $name,
                            dob: $dob,
                            gender: $gender,
                            weight: Binding<[Double]>(
                                get: { [Double(integerPart).addingDecimalPart(decimalPart)]},
                                set: { _ in }
                            )
                        )){
                            Text("Next")
                                .padding(.horizontal, 24)
                                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 50, alignment: .center)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(12)
                        }
                    }.padding()
                }
            }
        }.navigationBarBackButtonHidden()
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        return formatter
    }
}

extension Double {
    func addingDecimalPart(_ decimalPart: Int) -> Double {
        let decimalValue = Double(decimalPart) / 10.0
        return self + decimalValue
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
