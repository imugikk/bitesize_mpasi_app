//
//  ManageAccountView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 18/11/23.
//

import SwiftUI

struct ManageAccountView: View {
    
    @AppStorage("email") var email: String = ""
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ManageAccountView()
}
