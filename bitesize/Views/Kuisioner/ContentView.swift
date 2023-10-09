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
    
    var body: some View {
        NavigationView{
            VStack {
                InformationView()
                    .edgesIgnoringSafeArea(.horizontal)
                
                VStack (alignment: .leading){
                    NameTextView()
                        .edgesIgnoringSafeArea(.all)
                    
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
                    
                    GenderTextView()
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
                                        .background(selection == .male ? Color(red: 0.23, green: 0, blue: 0.9) : Color(red: 0.97, green: 0.96, blue: 1))
                                        .cornerRadius(8)
                                        .font(
                                        Font.custom("Work Sans", size: 12)
                                        .weight(.medium)
                                        )
                                        .kerning(0.6)
                                        .foregroundColor(selection == .male ? Color.white : Color(red: 0.23, green: 0, blue: 0.9))
                                }

                                Button(action: {
                                    selection = .female
                                    gender = selection.stringGender()
                                }) {
                                    Text("Female")
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .frame(width: 180, alignment: .center)
                                        .background(selection == .female ? Color(red: 0.23, green: 0, blue: 0.9) : Color(red: 0.97, green: 0.96, blue: 1))
                                        .cornerRadius(8)
                                        .font(
                                        Font.custom("Work Sans", size: 12)
                                        .weight(.medium)
                                        )
                                        .kerning(0.6)
                                        .foregroundColor(selection == .female ? Color.white : Color(red: 0.23, green: 0, blue: 0.9))
                                }
                        
                        Spacer(minLength: 16) // Right padding
                            }
                    .edgesIgnoringSafeArea(.all)
                    
                    HStack {
                        DateOfBirthView()
                            .edgesIgnoringSafeArea(.all)
                        
                        DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date){}
                    }
                    
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
                        
                        Button {
        
                        } label: {
                            NavigationLink(destination: BabyInputView(name: $name, dob: $dob, gender: $gender)){
                                
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
                    }.padding(.horizontal, 38)// Left padding
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
