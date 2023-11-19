//
//  UserProfileCard.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 11/11/23.
//

import SwiftUI

struct UserProfileCard: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State private var babies: [Babies] = []
    @State private var photo: URL?
    let calendar = Calendar.current
    
    @State private var user = User.MOCK_USER
    @State private var profileImage: UIImage?
    
    var body: some View {
        NavigationStack{
            
            HStack(alignment: .top, spacing: 10) {
                VStack {
//                    let imageURL = URL(string: String(photo) ?? URL(string: ""),
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 100, height: 100)
                        .background(
                            AsyncImage(url: photo) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(8)
                            } placeholder: {
                                //tempat taruh loading gambarnya biar ga cuma kosong doang viewnya
                            }
                        )
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 0.25)
                                .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.5)
                        )
                }
                
                VStack {
                    Text(babies.first?.name ?? "")
                        .font(
                            Font.custom("Inter-Medium", size: 22))
                        .kerning(0.088)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                        .padding(.leading, 10)
                        .padding(.bottom, 5)
                    
                    
                    Text("\(monthsSinceBirth(dob: babies.first?.dob)) months")
                        .font(Font.custom("Inter-Regular", size: 14))
                        .kerning(0.08)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                    
                    Text(babies.first?.gender ?? "")
                        .font(Font.custom("Inter-Regular", size: 14))
                        .kerning(0.08)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                    
                }
                                    
                    VStack{
                        
                        
                        NavigationLink("Edit") {
                            EditProfileView(name: babies.first?.name ?? "", age: "\(monthsSinceBirth(dob: babies.first?.dob))", gender: babies.first?.gender ?? "" )
                            
//
                                
                        }.kerning(0.4)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                            .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .trailing)
                            .opacity(1)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            


                    }
                    
                        
                
                
                
                
                
            }
            
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .top)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(8)
        }
        .onAppear{
            firestoreManager.getBabiesData(){ fetchBabies in
                self.babies = fetchBabies
            }
            
            firestoreManager.getPhoto() { url in
                self.photo = url
            }
        }
//        .padding(10)
//        .frame(maxWidth: .infinity, alignment: .top)
//        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
//        .cornerRadius(8)
    }
    
    func monthsSinceBirth(dob: Date?) -> Int {
        let currentDate = Date()
        let components = calendar.dateComponents([.month], from: dob ?? Date.now, to: currentDate)
        return components.month ?? 0
    }
}

#Preview {
    UserProfileCard()
}
