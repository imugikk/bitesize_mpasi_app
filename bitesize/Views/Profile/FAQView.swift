//
//  FAQView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 11/11/23.
//

import SwiftUI

struct FAQView: View {
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    @State var showSheet1: Bool = false
    @State var showSheet2: Bool = false
    @State var showSheet3: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Button(action: {
                    showSheet1.toggle()
                }, label: {
                    HStack {
                        Text("What is Z Score ?")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)
                    
                })
                .sheet(isPresented: $showSheet1, content: {
                    FAQSheet1()
                        .presentationDragIndicator(.visible)
                })
                
                Divider()
                    .padding(.horizontal, 16)
                
                Button(action: {
                    showSheet1.toggle()
                }, label: {
                    HStack {
                        Text("How to Calculate Z Score ?")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)
                    
                })
                .sheet(isPresented: $showSheet1, content: {
                    FAQSheet1()
                        .presentationDragIndicator(.visible)
                })
                Divider()
                    .padding(.horizontal, 16)
                
                
                Button(action: {
                    showSheet1.toggle()
                }, label: {
                    HStack {
                        Text("What is the Importance of Z Score ?")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)
                    
                })
                .sheet(isPresented: $showSheet1, content: {
                    FAQSheet1()
                        .presentationDragIndicator(.visible)
                })
                Divider()
                    .padding(.horizontal, 16)
                
                
                
                Button(action: {
                    showSheet1.toggle()
                }, label: {
                    HStack {
                        Text("How to Calculate Calories Target ?")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)
                    
                })
                .sheet(isPresented: $showSheet1, content: {
                    FAQSheet1()
                        .presentationDragIndicator(.visible)
                })
                Divider()
                    .padding(.horizontal, 16)
                
                Button(action: {
                    showSheet1.toggle()
                }, label: {
                    HStack {
                        Text("How to Calculate Nutrition Target ?")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text(">")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.trailing, 32)
                    }
                    .padding(.top, 8)
                    .padding(.leading, 32)
                    
                })
                .sheet(isPresented: $showSheet1, content: {
                    FAQSheet1()
                        .presentationDragIndicator(.visible)
                })
                Divider()
                    .padding(.horizontal, 16)
                Spacer()
                
            }
        }
        
        //Custom NavToolBar
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Frequently Asked Questions")
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("BackIcon")
                        .frame(width: 18, height: 24)
                    Text("Profile")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    
                        .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                })
            }
        })
    }
}

#Preview {
    FAQView()
}
