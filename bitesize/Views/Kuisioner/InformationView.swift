//
//  InformationView.swift
//  bitesize
//
//  Created by Michelle Annice on 04/10/23.
//

//import SwiftUI
//
//struct InformationView: View {
//    var body: some View {
//        VStack (alignment: .trailing) {
//            HStack (alignment: .center, spacing: 0.0){
//                Image(systemName: "exclamationmark.circle")
//                    .font(.system(size: 20))
//                    .foregroundColor(.black)
//            }
//            .padding()
//            .frame(width: 24, height: 24, alignment: .center)
//        }
//    }
//}
//
//struct InformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InformationView()
//    }
//}

import SwiftUI

struct InformationView: View {
    var body: some View {
        HStack {
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
