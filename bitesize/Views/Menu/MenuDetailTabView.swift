//
//  MenuDetailTabView.swift
//  bitesize
//
//  Created by Michelle Annice on 01/11/23.
//

import SwiftUI

struct MenuDetailTabView: View {
  var body: some View {
    TabView {
        Image("menudetail")
            .resizable()
            .scaledToFill()
        Image("menudetail")
            .resizable()
            .scaledToFill()
        Image("menudetail")
            .resizable()
            .scaledToFill()
    } //: TAB
    .frame(height: 342)
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
  }
}

struct MenuDetailTabView_Previews: PreviewProvider {
  static var previews: some View {
    MenuDetailTabView()
      .previewDevice("iPhone 14")
      .background(Color.gray)
  }
}
