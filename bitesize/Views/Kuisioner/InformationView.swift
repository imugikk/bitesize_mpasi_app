//
//  InformationView.swift
//  bitesize
//
//  Created by Michelle Annice on 04/10/23.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        HStack {
            Text("Input Baby Data")
                .font(
                    Font.custom("Nunito", size: 32)
                        .weight(.semibold)
                )
                .padding(.horizontal, 12)
                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
            Spacer() // Pushes the image to the right
            Image(systemName: "exclamationmark.circle")
                .font(.system(size: 24))
                .foregroundColor(.black)
                .padding(25)
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
