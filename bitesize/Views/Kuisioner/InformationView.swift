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
            Spacer() // Pushes the image to the right
            Image(systemName: "questionmark")
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
