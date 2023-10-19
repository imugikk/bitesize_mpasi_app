//
//  RecommendationTabView.swift
//  bitesize
//
//  Created by Michelle Annice on 23/10/23.
//

import SwiftUI

struct RecommendationTabView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack (spacing:8){
                RecommendationItemView()
                RecommendationItemView()
                RecommendationItemView()
            }
            .padding(.horizontal, 16)
      })
    }
}

#Preview {
    RecommendationTabView()
}
