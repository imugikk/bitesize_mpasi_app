//
//  EditDataSheet.swift
//  bitesize
//
//  Created by febriandianto prabowo on 11/11/23.
//

import SwiftUI

struct terms: Identifiable {
    let id = UUID()
    let Name: String
    @State var isSelected: Bool = false
    
    
    
}


struct EditDataSheet: View {
    
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    
    @State var babyCalories = ""
    @State var babyCarbo = ""
    @State var babyProtein = ""
    @State var babyFats = ""
    @State private var selectedDate : Date = .now
   
    var body: some View {
       NavigationStack{
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Calories (ccal)")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 317, height: 22, alignment: .leading)
                    .padding(.bottom, 4)
                TextField("Input baby's target calories" , text: $babyCalories).padding(.leading, 16)
                    .padding(.vertical, 13)
                    .frame(width: 358, height: 50, alignment: .leading)
                    .background(.white)
                
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.25)
                            .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                    )
                    .keyboardType(.numberPad)
                
            }
            .padding(0)
            .frame(width: 358, alignment: .topLeading)
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Carbohydrates (g) ")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 317, height: 22, alignment: .leading)
                    .padding(.bottom, 4)
                TextField("Input baby's target carbohydrates (g) " , text: $babyCarbo).padding(.leading, 16)
                    .padding(.vertical, 13)
                    .frame(width: 358, height: 50, alignment: .leading)
                    .background(.white)
                
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.25)
                            .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                    )
                    .keyboardType(.numberPad)
                
                
            }
            .padding(0)
            .frame(width: 358, alignment: .topLeading)
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Protein (g)")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 317, height: 22, alignment: .leading)
                    .padding(.bottom, 4)
                TextField("Input baby's target protein" , text: $babyProtein).padding(.leading, 16)
                    .padding(.vertical, 13)
                    .frame(width: 358, height: 50, alignment: .leading)
                    .background(.white)
                
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.25)
                            .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                    )
                    .keyboardType(.numberPad)
                
            }
            .padding(0)
            .frame(width: 358, alignment: .topLeading)
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
           VStack(alignment: .leading, spacing: 0) {
               
               Text("Fats (g)")
                   .font(
                       Font.custom("Inter", size: 16)
                           .weight(.semibold)
                   )
                   .kerning(0.16)
                   .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                   .frame(width: 317, height: 22, alignment: .leading)
                   .padding(.bottom, 4)
               TextField("Input baby's target fats" , text: $babyFats).padding(.leading, 16)
                   .padding(.vertical, 13)
                   .frame(width: 358, height: 50, alignment: .leading)
                   .background(.white)
               
                   .cornerRadius(8)
                   .overlay(
                       RoundedRectangle(cornerRadius: 8)
                           .inset(by: 0.25)
                           .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                   )
                   .keyboardType(.numberPad)
               
           }
           .padding(0)
           .frame(width: 358, alignment: .topLeading)
           .padding(.top, 20)
           .padding(.horizontal, 16)
           
           VStack(alignment: .leading, spacing: 0){
               
               Text("I have read and agree that the data I entered is in accordance with the doctor's instructions and any risks that arise are beyond our responsibility.")
                 .font(Font.custom("Inter", size: 14))
                 .kerning(0.08)
                 .foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.37))
                 .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                 .opacity(0.8)
           }
           .padding(0)
           .frame(width: 358, alignment: .topLeading)
           .padding(.bottom, 100)
           .padding(.horizontal, 16)
           
           
           
           
           
            
           
           
            Spacer()
            //Custom Nav Bar
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Edit Target")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                                    Text("Done")
                                .font(Font.custom("Inter", size: 16))
                                .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                            
                                .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                        })
                    }
                })
                .navigationBarTitleDisplayMode(.inline)
                .presentationDragIndicator(.visible)
                
        }
    }
}

#Preview {
    EditDataSheet()
}
