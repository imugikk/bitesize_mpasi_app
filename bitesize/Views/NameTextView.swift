//
//  NameTextView.swift
//  bitesize
//
//  Created by Michelle Annice on 04/10/23.
//

import SwiftUI

struct NameTextView: View {
    var body: some View {
        HStack {
            Text("Name")
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

struct NameTextView_Previews: PreviewProvider {
    static var previews: some View {
        NameTextView()
    }
}
