//
//  EditDataSheet.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import SwiftUI

struct EditDataSheet: View {
    
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    @State var calories = ""
    @State var babyWeight = ""
    @State var babyHeight = ""
    @State var babyCircumference = ""
    @State private var selectedDate : Date = .now
    
    var body: some View {
        NavigationStack{
                ScrollView{
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("Calories (ccal)")
                            .font(
                                Font.custom("Inter-SemiBold", size: 16)
                                    
                            )
                            .kerning(0.16)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(width: 317, height: 22, alignment: .leading)
                            .padding(.bottom, 4)
                        TextField("Input your target calories" , text: $calories).padding(.leading, 16)
                            .padding(.vertical, 13)
                            .frame(width: 358, height: 50, alignment: .leading)
                            .background(.white)
                        
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.25)
                                    .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                            )
                        
                    }
                    .padding(0)
                    .frame(width: 358, alignment: .topLeading)
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("Carbohydrates (g)")
                            .font(
                                Font.custom("Inter-SemiBold", size: 16)
                                    
                            )
                            .kerning(0.16)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(width: 317, height: 22, alignment: .leading)
                            .padding(.bottom, 4)
                        TextField("Input your target carbohydrates" , text: $babyWeight).padding(.leading, 16)
                            .padding(.vertical, 13)
                            .frame(width: 358, height: 50, alignment: .leading)
                            .background(.white)
                        
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.25)
                                    .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                            )
                        
                    }
                    .padding(0)
                    .frame(width: 358, alignment: .topLeading)
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("Protein (g)")
                            .font(
                                Font.custom("Inter-SemiBold", size: 16)
                                    
                            )
                            .kerning(0.16)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(width: 317, height: 22, alignment: .leading)
                            .padding(.bottom, 4)
                        TextField("Input your target protein" , text: $babyHeight).padding(.leading, 16)
                            .padding(.vertical, 13)
                            .frame(width: 358, height: 50, alignment: .leading)
                            .background(.white)
                        
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.25)
                                    .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                            )
                        
                    }
                    .padding(0)
                    .frame(width: 358, alignment: .topLeading)
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("Fats (g)")
                            .font(
                                Font.custom("Inter-SemiBold", size: 16)
                             
                            )
                            .kerning(0.16)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(width: 317, height: 22, alignment: .leading)
                            .padding(.bottom, 4)
                        TextField("Input your target fats" , text: $babyCircumference).padding(.leading, 16)
                            .padding(.vertical, 13)
                            .frame(width: 358, height: 50, alignment: .leading)
                            .background(.white)
                        
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.25)
                                    .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                            )
                        
                    }
                    .padding(0)
                    .frame(width: 358, alignment: .topLeading)
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("I have read and agree that the data I entered is in accordance with the doctor's instructions and any risks that arise are beyond our responsibility.")
                          .font(Font.custom("Inter", size: 14))
                          .kerning(0.08)
                          .foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.37))
                          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }
                    .padding(0)
                    .frame(width: 358, alignment: .topLeading)
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                    
                }
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Edit Data")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            firestoreManager.editGiziBabies(calori: [Double(calories) ?? 0], carbs: Double(babyWeight) ?? 0, fat: Double(babyCircumference) ?? 0, protein: Double(babyHeight) ?? 0)
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                                    Text("Done")
                                .font(Font.custom("Inter-Regular", size: 16))
                                .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                            
                                .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                        })
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                                    Text("Cancel")
                                .font(Font.custom("Inter-Regular", size: 16))
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
