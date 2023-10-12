//
//  RegisterView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/10/23.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var registerVM = RegisterManager()
    
    var body: some View {
        VStack{
            TextField("Email", text: $registerVM.email).padding(.bottom,10)
            SecureField("Password", text: $registerVM.password).padding(.bottom,10)
            
            Button("Create Account"){
                registerVM.register {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
        }.padding()
    }
}

#Preview {
    RegisterView()
}
