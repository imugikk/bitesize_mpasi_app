//
//  SavedMenuView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 11/11/23.
//

import SwiftUI

struct SavedMenuView: View {
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State private var savedMenu: [Any] = []
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Text("hello world")
            }
            .onAppear{
                firestoreManager.getSavedMenu{ fetchMenu in
                    self.savedMenu = fetchMenu
                    print(fetchMenu)
                }
            }
        }
        
        
        //Custom NavToolBar
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Saved Menu")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image("BackIcon")
                            .frame(width: 18, height: 24)
                                Text("Profile")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                        
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                    })
                }
            })
    }
}

#Preview {
    SavedMenuView()
}
