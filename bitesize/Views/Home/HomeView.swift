//
//  HomeView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 08/10/23.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var babies: [Babies] = []
    @State private var menu: [Any] = []
    @State private var zScoreView: [Double] = []
    
    @State var selection = 0
    
    
    var body: some View {
        let nutrition = babies.last?.nutrition ?? [0]
        let lowerBoundCarbs = String(format: "%.1f", nutrition.last! * 0.35)
        let upperBoundCarbs = String(format: "%.1f", nutrition.last! * 0.60)
        let resultTextCarbs = "\(lowerBoundCarbs)~\(upperBoundCarbs)g"
        
        let lowerBoundFat = String(format: "%.1f", nutrition.last! * 0.10)
        let upperBoundFat = String(format: "%.1f", nutrition.last! * 0.15)
        let resultTextFat = "\(lowerBoundFat)~\(upperBoundFat)g"
        
        let lowerBoundProtein = String(format: "%.1f", nutrition.last! * 0.30)
        let upperBoundProtein = String(format: "%.1f", nutrition.last! * 0.45)
        let resultTextProtein = "\(lowerBoundProtein)~\(upperBoundProtein)g"
        
        TabView(selection: $selection){
            NavigationView{
                VStack{
                    
                        SummaryCardView()
                            .environmentObject(firestoreManager)
                        
                        Spacer().frame(height: 20)
                        
//                        VStack(alignment: .leading) {
//                            VStack (alignment: .leading){
//                                Text("Enjoy Stress-Free Weaning")
//                                    .frame(width: 304, height: 32)
//                                    .font(
//                                        Font.custom("Nunito", size: 24)
//                                            .weight(.semibold)
//                                    )
//                                    .kerning(0.24)
//                                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
//                                
//                                Spacer().frame(height: 4)
//                                
//                                Text("Reimagine mealtimes with our expertly curated kits, tailored to your baby's individual nutritional needs.")
//                                    .font(Font.custom("Inter", size: 12))
//                                    .kerning(0.2)
//                                    .foregroundColor(Color(red: 0.13, green: 0.16, blue: 0.16))
//                                    .frame(width: 326, height: 32 , alignment: .leading)
//                            }
//                            .frame(width: 326, height: 68)
//                            
//                            Spacer().frame(height: 16)
//                            
//                            
//                            NavigationLink(destination: MenuView()) {
//                                
//                                HStack(alignment: .center, spacing: 4) {
//                                    Text("Start Feeding")
//                                      .font(
//                                        Font.custom("Inter", size: 14)
//                                          .weight(.medium)
//                                      )
//                                      .kerning(0.4)
//                                      .multilineTextAlignment(.center)
//                                      .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
//                                }
//                                .padding(.horizontal, 24)
//                                .padding(.vertical, 8)
//                                .frame(maxWidth: .infinity, minHeight: 36, maxHeight: 36, alignment: .center)
//                                .background(.white)
//
//                                .cornerRadius(8)
//                                .overlay(
//                                RoundedRectangle(cornerRadius: 8)
//                                .inset(by: 0.5)
//                                .stroke(Color(red: 0.16, green: 0.49, blue: 0.36), lineWidth: 1)
//
//                                )
//                            }
//                           
//                        }
//                        .padding(.horizontal, 16)
//                        .padding(.top, 12)
//                        .padding(.bottom, 16)
//                        .frame(width: 358, height: 148, alignment: .leading)
//                        .background(
//                            LinearGradient(
//                                stops: [
//                                    Gradient.Stop(color: Color(red: 0.93, green: 0.98, blue: 0.96), location: 0.00),
//                                    Gradient.Stop(color: Color(red: 0.69, green: 0.92, blue: 0.83), location: 1.00),
//                                        ],
//                                            startPoint: UnitPoint(x: 0.57, y: 1),
//                                            endPoint: UnitPoint(x: 1.07, y: 1)
//                                    )
//                            )
//                            .cornerRadius(8)
//                        
//                            .padding(.horizontal, 16)
                        
//                        Spacer().frame(height: 20)
                        //Recommendation
                        Text("Recommendation")
                            .font(Font.custom("Inter", size: 22)
                            .weight(.medium)
                            )
                            .kerning(0.088)
                            .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))

                            .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                        
                            .padding(.horizontal, 16)
                        
                        Spacer().frame(height: 8)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(menu.indices, id: \.self) { index in
                                    if let menuItem = menu[index] as? [Any] {
                                        NavigationLink(destination: MenuDetailView(menuId: menuItem[3] as! String, menuImage: menuItem[5] as! String?)){
                                            RecommendationItemView(menuName: menuItem[0] as! String, menuId: menuItem[3] as! String, menuAllergy: menuItem[4] as! [String]?, menuImage: menuItem[5] as! String?)
                                        }
                                    }
                                }
                            }
                        }.padding(.horizontal, 16)
                        
                        Spacer().frame(height: 20)
                        
                        Text("Category")
                          .font(
                            Font.custom("Nunito", size: 24)
                              .weight(.semibold)
                          )
                          .kerning(0.24)
                          .foregroundColor(.black)
                          .frame(maxWidth: .infinity, alignment: .leading)
                        
                          .padding(.horizontal, 16)
                        
                        Spacer().frame(height: 8)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                CategoryItemView(title: "High Protein")
                                CategoryItemView(title: "High Fat")
                                CategoryItemView(title: "High Carbs")
                            }
                        }.padding(.horizontal, 16)
                        
                        Spacer()
                        
//                        NavigationLink(destination: ARViewForSwiftUI().edgesIgnoringSafeArea(.all)) {
//                            Text("AR Kit")
//                        }
                        
                    }.onAppear{
                        firestoreManager.getBabiesData(){ fetchBabies in
                            self.babies = fetchBabies
                        }
                        
                        firestoreManager.getMenuRecommendation() { fetchMenu in
                            self.menu = fetchMenu
                        }
                    }
                    .navigationBarBackButtonHidden()
                    .navigationBarTitleDisplayMode(.inline)
               
                    
            }
            .tabItem{
//                Image("SummaryIcon")
//                    .frame(width: 17.70833, height: 25)
//                Text("Summary")
                
                if selection == 0 {
                    Image("SummaryIconActive")
                        .frame(width: 17.70833, height: 25)
//                    Text("Summary")
//                        .foregroundColor(Color(red: 0.93, green: 0.98, blue: 0.96))
                } else {
                    Image("SummaryIcon")
                        .frame(width: 17.70833, height: 25)
//                    Text("Summary")
//                        .foregroundColor(Color(red: 0.93, green: 0.98, blue: 0.96))
                }
                
                Text("Summary")
            }.tag(0)
            
            MenuView()
                .tabItem {
                    if selection == 1 {
                        Image("MyMenuIconActive")
                            .frame(width: 17.70833, height: 25)
                    } else {
                        Image("MyMenuIcon")
                            .frame(width: 17.70833, height: 25)
                    }
//                    Image("MyMenuIcon")
//                        .frame(width: 17.70833, height: 25)
                    
                    Text("My Menu")
                }.tag(1)
            
            ProgressView()
                .tabItem {
                    if selection == 2 {
                        Image("ProgressIconActive")
                            .frame(width: 17.70833, height: 25)
                    } else {
                        Image("ProgressIcon")
                            .frame(width: 17.70833, height: 25)
                    }
                    
//                    Image("ProgressIcon")
                    Text("Progress")
                }.tag(2)
            
            ProfileView()
                .tabItem {
                    if selection == 3 {
                        Image("ProfileIconActive")
                            .frame(width: 17.70833, height: 25)
                    } else {
                        Image("ProfileIcon")
                            .frame(width: 17.70833, height: 25)
                    }
//                    Image("ProfileIcon")
                    Text("Profile")
                }.tag(3)
        }
        .tint(.accentColor)
        .navigationBarBackButtonHidden()
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
