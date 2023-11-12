//
//  LoadingViewMain.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import SwiftUI

struct LoadingViewMain: View {
    @State var percent: CGFloat = 0
    
    var body: some View {
        
         GifImage("Loading")
    }
}

#Preview {
    LoadingViewMain()
}
