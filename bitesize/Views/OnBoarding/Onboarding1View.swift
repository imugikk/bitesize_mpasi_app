//
//  Onboarding1View.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import SwiftUI

struct Onboarding1View: View {
    
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    var page: Page
    
    var body: some View {
        
            VStack{
                VStack(alignment: .center, spacing: 60) {
                    
                    Image("\(page.imageUrl)")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .padding(.bottom, 60)
                        .padding(.top, 64)
                        
                }
                .padding(0)
                
                    
                
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("\(page.name)")
                      .font(
                        Font.custom("Nunito-SemiBold", size: 32)
                        
                          
                      )
                      
                      .kerning(0.32)
                      .foregroundColor(.black)
                      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                      .padding(.horizontal, 16)
                      
                    
              
                    Text("\(page.description) ")
                      .font(Font.custom("Inter-Regular", size: 16))
                      .foregroundColor(.black)
                      .frame(minWidth: 358, maxWidth: 358, maxHeight: .infinity, alignment: .leading)
                      .padding(.horizontal, 16)
                    
                    
                }
                .padding(0)
                .frame(height: 108, alignment: .topLeading)
                    
                Spacer()
//                HStack (alignment: .center){
//                    HStack {
//                        Text("")
//                            .padding(.horizontal, 30)
//                    }
//                    Spacer()
//                    HStack{
//                        Image("Dots1")
//                            .padding()
//                        
//                        
//                    }
//                    .padding(0)
//               Spacer()
//                    
//                    HStack{
//                        Image("NextOnboarding")
//                        
//                    }
//                    
//                }.padding(.horizontal, 16)
             
            }
            Spacer()
            
        
            
            
            
            //Custom Navigation Title
                .navigationTitle("")
//                .toolbar{
//                    Button{
//                        print("save")
//                    } label: {
//                        
//                      
//                        HStack(alignment: .center, spacing: 0) {
//                            Text("Skip")
//                        
//                        }
//                    }
//                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
//                    .padding(.leading, 9)
//                    .padding(.trailing, 16)
//                    .padding(.vertical, 9)
//                    .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .trailing)
//
//                }
                .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    Onboarding1View(page: Page.samplePage)
}
