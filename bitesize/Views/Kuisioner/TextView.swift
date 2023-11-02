//
//  TextView.swift
//  bitesize
//
//  Created by Michelle Annice on 12/10/23.
//

import SwiftUI

struct TextView: View {
    let labelText: String

    init(labelText: String) {
        self.labelText = labelText
    }

    var body: some View {
        HStack {
            Text(labelText)
                .font(
                Font.custom("Inter", size: 16)
                .weight(.semibold)
                )
                .kerning(0.16)
                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(labelText: "Custom Text")
    }
}
