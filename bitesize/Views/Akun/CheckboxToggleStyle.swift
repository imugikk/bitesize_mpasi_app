//
//  CheckboxToggleStyle.swift
//  bitesize
//
//  Created by Michelle Annice on 08/11/23.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "checkmark" : "checkmark")
            .resizable()
            .scaledToFit()
            .foregroundColor(configuration.isOn ? Color(red: 0.18, green: 0.56, blue: 0.42) : Color(red: 0.35, green: 0.38, blue: 0.37))
//            .overlay {
//                if !configuration.isOn {
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.blue, lineWidth: 5)
//                }
//            }
            .cornerRadius(8)
            .onTapGesture {
                configuration.isOn.toggle()
            }
    }
}

//#Preview {
//    CheckboxToggleStyle()
//}
