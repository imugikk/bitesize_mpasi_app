//
//  OnboardingMain.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import SwiftUI

struct OnboardingMain: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                
                VStack{
                    HStack{
                        //NavigationLink to LoginView
                        Text("Skip")
                    }
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    .padding(.leading, 9)
                    .padding(.trailing, 16)
                    .padding(.vertical, 9)
                    .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .trailing)
                    Onboarding1View(page: page)
                    Spacer()
                    
                        
                 
                    
                    if page == pages.last {
                        
                        VStack {
                            Spacer()
                            //Put Navigation Link Here to Login Page
                            HStack(alignment: .center, spacing: 97) {
                                Spacer()
                                Image("NextOnboarding")
                                
                            }
                            
                        }.padding(.horizontal,16)
                        
                        
                    }
                    
                    else {
                        Button(action: incrementPage) {
                            VStack {
                                Spacer()
                                //Put Navigation Link Here to Login Page
                                HStack(alignment: .center, spacing: 97) {
                                    Spacer()
                                    Image("NextOnboarding")
                                    
                                }
                                
                            }.padding(.horizontal,16)
                        }
                        
                    }
                    
                }
                
                .tag(page.tag)
                
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .init(Color(red: 0.16, green: 0.49, blue: 0.36))
            dotAppearance.pageIndicatorTintColor = .init(Color(red: 0.71, green: 0.73, blue: 0.73))
            
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
