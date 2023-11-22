//
//  AllergyView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 22/11/23.
//

import SwiftUI

struct AllergiesView: View {
    
    @State var allergyName: String?
    
    var body: some View {
        Image(imageNameForAllergy())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
    }
    
    private func imageNameForAllergy() -> String {
            switch allergyName {
            case "Egg": return "Egg"
            case "Chicken": return "Chicken"
            case "Fish": return "Fish"
            case "Meat": return "Meat"
            case "Milk": return "Milk"
            case "Peanut": return "Peanut"
            case "Shrimp": return "Shrimp"
            default: return "Unknown"
            }
        }
}

#Preview {
    AllergiesView(allergyName: "Egg")
}
