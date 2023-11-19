//
//  LoadingAnimation.swift
//  bitesize
//
//  Created by febriandianto prabowo on 20/11/23.
//

import SwiftUI

struct LoadingAnimation: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        HStack{
            ForEach(0..<3) { index in
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                    .scaleEffect(animationAmount)
                    .opacity(Double(3 - index)/3)
                    .animation(.easeInOut(duration: 1.5)
                        .repeatForever(autoreverses : true)
                        .delay(0.25 * Double(index)), value: animationAmount)
                    
                
            }
        }.onAppear{
            animationAmount = 1
        }
    }
}

#Preview {
    LoadingAnimation()
}
