//
//  EditProfileView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 10/11/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    
    
    var body: some View {
        @State var babyName = ""
        @State var babyAge = ""
        @State var babyGender = ""
        @State var showingActionSheet = false
       
        NavigationStack{
            
//            HStack(alignment: .center, spacing: 0) {
//                NavigationLink(destination: ProfileView()) {
//                    HStack(alignment: .center, spacing: 5) {
//                        Image("BackIcon")
//                            .frame(width: 18, height: 24)
//                        Text("Profile")
//                            .font(Font.custom("Inter", size: 16))
//                            .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
//
//                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
//                    }
//                    .padding(.leading, 7)
//                }
//
//                
//                
//                HStack(alignment: .center, spacing: 0) {
//                    
//                    Text("Edit Baby Profile")
//                        .font(
//                        Font.custom("Inter", size: 16)
//                        .weight(.semibold)
//                        )
//                        .kerning(0.16)
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
//
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//                       
//
//                    
//                    
//                }
//                
//                .padding(.horizontal, 0)
//                .padding(.vertical, 9)
//                .frame(maxWidth: .infinity, alignment: .center)
//                
//                HStack(alignment: .center, spacing: 0) {
//                
//                    Text("Done")
//                }
//                .padding(.leading, 9)
//                .padding(.trailing, 16)
//                .padding(.vertical, 9)
//                .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .trailing)
//                
//                   
//        
//                
//            }
//            .padding(0)
//            .frame(width: 390, height: 42, alignment: .center)
            
            PhotosPicker(selection: $viewModel.selectedItem) {
                if let profileImage = viewModel.profileImage{
                    
                    VStack{
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        Text("Change Photo")
                            .font(
                                Font.custom("Inter", size: 16)
                                    .weight(.semibold)
                            )
                            .kerning(0.16)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                            .frame(width: 150, height: 30, alignment: .center)
                    }
                } else {
                    VStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 100, height: 100)
                            .background(
                                Image("ProfilePicture")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .opacity(0.4)
                            )
                            .cornerRadius(100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .inset(by: 0.25)
                                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.5)
                                
                                
                            )
                        
                        Text("Add Photo")
                            .font(
                                Font.custom("Inter", size: 16)
                                    .weight(.semibold)
                            )
                            .kerning(0.16)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                            .frame(width: 86, height: 30, alignment: .center)
                        
                    }
                }
                
            }
            
            
            //            Rectangle()
            //                .foregroundColor(.clear)
            //                .frame(width: 100, height: 100)
            //                .background(
            //                    Image("PATH_TO_IMAGE")
            //                        .resizable()
            //                        .aspectRatio(contentMode: .fill)
            //                        .frame(width: 100, height: 100)
            //                        .clipped()
            //                        .opacity(0.4)
            //                )
            //                .cornerRadius(100)
            //                .overlay(
            //                    RoundedRectangle(cornerRadius: 100)
            //                        .inset(by: 0.25)
            //                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.5)
            //
            //                )
            //
            //            Text("Add Photo")
            //                .font(
            //                    Font.custom("Inter", size: 16)
            //                        .weight(.semibold)
            //                )
            //                .kerning(0.16)
            //                .multilineTextAlignment(.center)
            //                .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
            //                .frame(width: 86, height: 30, alignment: .center)
            
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Name")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 317, height: 22, alignment: .leading)
                    .padding(.bottom, 4)
                TextField("Input your baby name" , text: $babyName).padding(.leading, 16)
                    .padding(.vertical, 13)
                    .frame(width: 358, height: 50, alignment: .leading)
                    .background(.white)
                
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.25)
                            .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                    )
                
            }
            .padding(0)
            .frame(width: 358, alignment: .topLeading)
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Baby Age (Months)")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 317, height: 22, alignment: .leading)
                    .padding(.bottom, 4)
                TextField("Input your baby age" , text: $babyName).padding(.leading, 16)
                    .padding(.vertical, 13)
                    .frame(width: 358, height: 50, alignment: .leading)
                    .background(.white)
                
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.25)
                            .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                    )
                
            }
            .padding(0)
            .frame(width: 358, alignment: .topLeading)
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Gender")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 317, height: 22, alignment: .leading)
                    .padding(.bottom, 4)
                TextField("Input your baby age" , text: $babyName).padding(.leading, 16)
                    .padding(.vertical, 13)
                    .frame(width: 358, height: 50, alignment: .leading)
                    .background(.white)
                
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.25)
                            .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                    )
                
            }
            .padding(0)
            .frame(width: 358, alignment: .topLeading)
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            

        
               
            .navigationTitle("Edit Baby Profile")
            .toolbar{
                Button{
                    print("save")
                } label: {
                    HStack(alignment: .center, spacing: 0) {
                                        Text("Done")
                        
                                    }
//                                    .padding(.leading, 9)
//                                    .padding(.trailing, 16)
//                                    .padding(.vertical, 9)
//                                    .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .trailing)
                    
                    
                }
                .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                .padding(.leading, 9)
                .padding(.trailing, 16)
                .padding(.vertical, 9)
                .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .trailing)

            }
            .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
                
        }
        
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USER)
}
