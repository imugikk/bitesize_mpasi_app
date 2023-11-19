//
//  AllergyView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/11/23.
//

import SwiftUI

struct AllergyView: View {
    
    @State var allergy: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                )
            
            Text(allergy)
                .foregroundColor(.white)
                .font(.system(size: 8.5))

//            Path { path in
//                let angle: CGFloat = .pi / 4
//                let radius: CGFloat = 15
//                let center = CGPoint(x: 15, y: 15)
//                let startPoint = CGPoint(x: center.x - radius * cos(angle),
//                                         y: center.y - radius * sin(angle))
//                let endPoint = CGPoint(x: center.x + radius * cos(angle),
//                                       y: center.y + radius * sin(angle))
//                
//                path.move(to: startPoint)
//                path.addLine(to: endPoint)
//            }
//            .stroke(Color.black, lineWidth: 1)
        }
        .frame(width: 35, height: 35)
    }
}

#Preview {
    AllergyView(allergy: "Nuts")
}
