//
//  MenuDetailTabView.swift
//  bitesize
//
//  Created by Michelle Annice on 01/11/23.
//

import SwiftUI

struct MenuDetailTabView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    var menuImage: String?


    init( menuImage: String?) {
     
        self.menuImage = menuImage
    }
    
  var body: some View {
    TabView {
     
        if let menuImage = menuImage{
            
            let imageURL = URL(string: menuImage) ?? URL(string: "")
            
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        //tempat taruh loading gambarnya biar ga cuma kosong doang viewnya
                    }
                ).padding(.top, 8)
            
            
        } else {
            
            
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    Image("pasta")
                        .resizable()
                        .scaledToFill()
                ).padding(.top, 8)
            
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    Image("pasta")
                        .resizable()
                        .scaledToFill()
                ).padding(.top, 8)
            
            
//            Image("menudetail")
//                .resizable()
//                .scaledToFill()
//            Image("menudetail")
//                .resizable()
//                .scaledToFill()
//            Image("menudetail")
//                .resizable()
//                .scaledToFill()
        }
        
        
    } //: TAB
    .frame(height: 342)
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
  }
}

//struct MenuDetailTabView_Previews: PreviewProvider {
//  static var previews: some View {
//    MenuDetailTabView()
//      .previewDevice("iPhone 14")
//      .background(Color.gray)
//  }
//}
