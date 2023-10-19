//
//  MenuDetailView.swift
//  bitesize
//
//  Created by Michelle Annice on 01/11/23.
//

import SwiftUI

struct MenuDetailView: View {
    var body: some View {
        ScrollView{
            MenuDetailTabView()
//                .scaledToFit()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    MenuDetailView()
}


