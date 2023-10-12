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
                Font.custom("Work Sans", size: 16)
                .weight(.medium)
                )
                .kerning(0.2)
                .foregroundColor(Color(red: 0.23, green: 0, blue: 0.9))
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
