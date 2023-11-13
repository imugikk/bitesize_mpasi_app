//
//  LoadingViewMain.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import SwiftUI

struct LoadingViewMain: View {
    @State var percent: CGFloat = 0
    @State var isActive: Bool = false
    

    
    var body: some View {
        if isActive {
            ResultView()
        }
        else {
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 358, height: 5)
                    .padding(.top, 222)
                    .background(
                        GifImage("Loading")
                        
                    )
                LoadingBarView(isActive: $isActive)
                    .padding(.top, 16)
                
                
                Text("Formulating Weaning Food Calories Target")
                  .font(
                    Font.custom("Inter", size: 16)
                      .weight(.semibold)
                  )
                  .kerning(0.16)
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
            }
            .padding(.top, 100)
            Spacer()
            
        }
            
        
    }
}

#Preview {
    LoadingViewMain()
}
