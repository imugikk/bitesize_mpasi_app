//
//  IngredientsView.swift
//  bitesize
//
//  Created by Michelle Annice on 06/11/23.
//

import SwiftUI

struct IngredientsView: View {
    
    var bahan: [String : [String : String]]
    
    var body: some View {
        VStack{
            ForEach(bahan.sorted(by: { $0.key < $1.key }), id: \.key) { ingredient, properties in
                VStack(alignment: .leading) {
                    Text("Ingredient: \(ingredient)")
                        .font(.headline)
                    
                    ForEach(properties.sorted(by: { $0.key < $1.key }), id: \.key) { property, value in
                        HStack {
                            Text("\(property):")
                                .font(.subheadline)
                            Text(value)
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    IngredientsView()
//}
