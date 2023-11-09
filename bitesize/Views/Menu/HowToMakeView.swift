//
//  HowToMakeView.swift
//  bitesize
//
//  Created by Michelle Annice on 06/11/23.
//

import SwiftUI

struct HowToMakeView: View {
    
    var step: [String]
    
    var body: some View {
        VStack{
            ForEach(step, id: \.self) { step in
                Text(step)
            }
        }
    }
}

//#Preview {
//    HowToMakeView()
//}
