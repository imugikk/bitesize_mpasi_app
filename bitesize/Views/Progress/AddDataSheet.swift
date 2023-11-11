//
//  AddDataSheet.swift
//  bitesize
//
//  Created by febriandianto prabowo on 11/11/23.
//

import SwiftUI

struct AddDataSheet: View {
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>


    @State var babyWeight = ""
    @State var babyHeight = ""
    @State var babyCircumference = ""
    @State private var selectedDate : Date = .now
   
    
    var body: some View {
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Weight (Kg)")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 317, height: 22, alignment: .leading)
                    .padding(.bottom, 4)
                TextField("Input your baby name" , text: $babyWeight).padding(.leading, 16)
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
                
                Text("Height (cm)")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 317, height: 22, alignment: .leading)
                    .padding(.bottom, 4)
                TextField("Input baby's Height" , text: $babyWeight).padding(.leading, 16)
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
                
                Text("Head Circumference (cm)")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 317, height: 22, alignment: .leading)
                    .padding(.bottom, 4)
                TextField("Input baby's head circumference" , text: $babyCircumference).padding(.leading, 16)
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
                
              
                DatePicker(selection: $selectedDate, displayedComponents: [.date]) {
                    Text("Date Measured")
                        .font(
                            Font.custom("Inter", size: 16)
                                .weight(.semibold)
                        )
                        .kerning(0.16)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        
                        .padding(.bottom, 4)
                    
                }
            }
            .padding(0)
            .frame(width: 358, alignment: .topLeading)
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
            Spacer()
            
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Add Data")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                                    Text("Add")
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
    AddDataSheet()
}
