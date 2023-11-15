//
//  OnboardingMain.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import SwiftUI

struct OnboardingMain: View {
    @State private var pageIndex = 2
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    
    var body: some View {
        NavigationStack{
            TabView(selection: $pageIndex) {
                ForEach(pages) { page in
                    
                    VStack{
                        Spacer()
//                        HStack{
//                            NavigationLink {
//                                LoginView()
//                            } label: {
//                                Text("Skip")
//                            }
//
//                            
//                        }
//                        .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
//                        .padding(.leading, 9)
//                        .padding(.trailing, 16)
//                        .padding(.vertical, 9)
//                        .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .trailing)
                        Onboarding1View(page: page)
                            
                       
                        
                        
                        
                        
                        if page == pages.last {
                            
//                            VStack {
//                               
//                                //Put Navigation Link Here to Login Page
//                                HStack(alignment: .center, spacing: 97) {
//                                    Spacer()
//                                    Image("NextOnboarding")
//                                    
//                                }
//                                
//                            }.padding(.horizontal,16)
                            
                            
                        }
                        
                        else {
                            Button(action: incrementPage) {
                                VStack {
                                    Spacer()
                                    //Put Navigation Link Here to Login Page
                                    HStack(alignment: .center, spacing: 97) {
                                        Spacer()
                                      
                                        
                                    }
                                    
                                }.padding(.horizontal,16)
                            }
                            
                        }
                        
                    }
                    
                    .tag(page.tag)
                    
                }
            }
            .padding(.bottom, 68)
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = .init(Color(red: 0.16, green: 0.49, blue: 0.36))
                dotAppearance.pageIndicatorTintColor = .init(Color(red: 0.71, green: 0.73, blue: 0.73))
            
           
            }
            
            VStack {
                NavigationLink(destination: LoginView()) {
                    
                    HStack(alignment: .center, spacing: 4) {
                        
                        Text("Get Started")
                          .font(
                            Font.custom("Inter-Medium", size: 16)
                              
                          )
                          .kerning(0.2)
                          .foregroundColor(Color(red: 0.93, green: 0.98, blue: 0.96))
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .frame(width: 358, height: 54, alignment: .center)
                    .background(Color(red: 0.18, green: 0.56, blue: 0.42))
                    .cornerRadius(12)
                    
                }
                
                
                
                
            }
            
            .padding(.bottom, 10 )
            Spacer()
            
            
        }
    }
    
    func incrementPage() {
        pageIndex += 1
        
    }
    
    func goToZero() {
        
        pageIndex = 0
    }
}

#Preview {
    OnboardingMain()
}
