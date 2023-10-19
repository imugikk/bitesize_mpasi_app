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
//            .frame(height: 200)
        Image("menudetail")
//            .resizable()
        Image("menudetail")
//            .resizable()
    } //: TAB
    .frame(height: 200)
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
