//
//  TextCarbsFatProteinText.swift
//  bitesize
//
//  Created by Michelle Annice on 14/10/23.
//

import SwiftUI

struct TextCarbsFatProteinView: View {
    let labelText: String

    init(labelText: String) {
        self.labelText = labelText
    }

    var body: some View {
        HStack {
            Text(labelText)
                .font(
                    Font.custom("Inter", size: 16)
                        .weight(.medium)
                )
                .kerning(0.2)
                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
        }
    }
}

struct TextCarbsFatProtein_Previews: PreviewProvider {
    static var previews: some View {
        TextCarbsFatProteinView(labelText: "Custom Text")
    }
}
