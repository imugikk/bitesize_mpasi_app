//
//  TermsView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 11/11/23.
//

import SwiftUI

struct TermsView: View {
    
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    var body: some View {
        
        NavigationStack{
          
            ScrollView{
                VStack {
                    Spacer()
                    HStack {
                        Text("App Disclaimer")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .kerning(0.088)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        .frame(width: 358, alignment: .leading)
                    }
                   
                 
                    HStack {
                        Text("**Medical Information Disclaimer**")
                            .font(.headline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                  Spacer()
                    HStack {
                        Text("The information provided by Bitesize is intended for general informational purposes only. It is not a substitute for professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or another qualified healthcare provider with any questions you may have regarding a medical condition.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    }
                    HStack {
                        Text("**Never Disregard Professional Medical Advice**")
                            .font(.headline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                   Spacer()
                    HStack {
                        Text("Never disregard professional medical advice or delay in seeking it because of something you have read on the App. If you think you may have a medical emergency, call your doctor immediately. The App does not recommend or endorse any specific tests, physicians, products, procedures, opinions, or other information that may be mentioned on the App.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    }
                    HStack {
                        Text("**Reliance on Information**")
                            .font(.headline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    
                    Spacer()
                    HStack {
                        Text("The content on the App may be updated and changed periodically. While we strive to provide accurate and up-to-date information, no guarantee is given that the information provided on the App is correct, complete, or current.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    }
                    HStack {
                        Text("**Liability**")
                            .font(.headline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                    Spacer()
                  
                    HStack {
                        Text("In no event shall the App, its creators, or its affiliates be liable for any direct, indirect, incidental, special, or consequential damages, or damages for loss of profits, revenue, data, or use incurred by you or any third party, whether in an action in contract or tort, arising from your access to, or use of, the App.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    }
                    HStack {
                        Text("**Contact Us**")
                            .font(.headline)
                          .kerning(0.16)
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    } .padding(.top, 16)
                  Spacer()
                    
                    HStack {
                        Text("If you have any questions or concerns about this disclaimer or the information provided by the App, please contact us at appBitesize@gmail.com By using the App, you acknowledge that you have read and understood this disclaimer and agree to its terms and conditions.")
                          .font(Font.custom("Inter", size: 16))
                          .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                      .frame(width: 358, alignment: .leading)
                    }
                    Spacer()
                    HStack {
                        Text("Last updated: 10/10/2023\n-")
                          .font(Font.custom("Inter", size: 14))
                          .kerning(0.08)
                          .foregroundColor(Color(red: 0.5, green: 0.53, blue: 0.53))
                      .frame(width: 358, alignment: .leading)
                    }.padding(.top, 16)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Terms & Condition")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                                Text("Close")
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
    TermsView()
}
