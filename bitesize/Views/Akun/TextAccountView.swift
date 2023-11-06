//
//  TextAccountView.swift
//  bitesize
//
//  Created by Michelle Annice on 07/11/23.
//

import SwiftUI

struct TextAccountView: View {
    let labelText: String

    init(labelText: String) {
        self.labelText = labelText
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            Text(labelText)
            .font(
            Font.custom("Inter", size: 16)
            .weight(.semibold)
            )
            .kerning(0.16)
            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))

            .frame(width: 317, height: 22, alignment: .leading)
        }
        .frame(width: 358, alignment: .topLeading)
    }
}

#Preview {
    TextAccountView(labelText: "Custom Text")
}
