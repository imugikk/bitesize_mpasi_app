//
//  CategoryTabView.swift
//  bitesize
//
//  Created by Michelle Annice on 23/10/23.
//


import SwiftUI

struct CategoryTabView: View {
  var body: some View {
      ScrollView(.horizontal, showsIndicators: false, content: {
          HStack (spacing: 8){
              CategoryItemView()
              CategoryItemView()
              CategoryItemView()
          }
          .padding(.horizontal, 16)
    })
  }
}

struct CategoryTabView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryTabView()
  }
}
