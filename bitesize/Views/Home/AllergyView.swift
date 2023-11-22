//
//  AllergyView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/11/23.
//

import SwiftUI

struct AllergyView: View {
    
    @State var allergy: String
    
    var body: some View {
        ZStack {
            AllergiesView(allergyName: allergy)
        }
        .frame(width: 30, height: 30)
    }
}

#Preview {
    AllergyView(allergy: "Egg")
}
