//
//  LoadingBarView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import SwiftUI

struct LoadingBarView: View {
    
    @State private var containerWidth: CGFloat = 0
    
    var maxWidth: Double {
        return min((containerWidth / CGFloat(goal) * CGFloat(step)), containerWidth)
    }
    
    private var goal = 4
    @State private var step = 1
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading){
                GeometryReader {
                    geo in
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.clear)
                        .onAppear {
                            containerWidth = geo.size.width
                        }
                }
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.96))
                
                ZStack(alignment: .trailing){
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(red: 0.25, green: 0.8, blue: 0.59))
                    
    //                Text("1/4")
    //                    .foregroundColor(.white)
    //                    .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                    
                }
                
                .frame(width: maxWidth, height: 5)
                
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(16)
            
            
        }
        
    }
}

#Preview {
    LoadingBarView()
}
