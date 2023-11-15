//
//  HistoryView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 15/11/23.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 4) {
                
                Text("Date")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
                // HIGH FIDELITY/Body Small
                Text("Age (Months)")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
                // HIGH FIDELITY/Body Small
                Text("Weights (Kg)")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
                // HIGH FIDELITY/Body Small
                Text("Heights (Cm)")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
                // HIGH FIDELITY/Body Small
                Text("Head Circ..(Cm)")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .top)
            Divider()
        }
        .padding(16)
        .frame(width: 358, height: 158, alignment: .topLeading)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(8)
    }
}

#Preview {
    HistoryView()
}
