//
//  HomeView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 08/10/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var babies: [Babies] = []
    @State private var menu: [String] = []
    
    
    var body: some View {
        let nutrition = babies.last?.nutrition ?? 0.0
        let lowerBoundCarbs = String(format: "%.1f", nutrition * 0.35)
        let upperBoundCarbs = String(format: "%.1f", nutrition * 0.60)
        let resultTextCarbs = "\(lowerBoundCarbs)~\(upperBoundCarbs)g"
        
        let lowerBoundFat = String(format: "%.1f", nutrition * 0.10)
        let upperBoundFat = String(format: "%.1f", nutrition * 0.15)
        let resultTextFat = "\(lowerBoundFat)~\(upperBoundFat)g"
        
        let lowerBoundProtein = String(format: "%.1f", nutrition * 0.30)
        let upperBoundProtein = String(format: "%.1f", nutrition * 0.45)
        let resultTextProtein = "\(lowerBoundProtein)~\(upperBoundProtein)g"
        
        TabView{
            NavigationView{
                ScrollView{
                    VStack{
                        //Target Card View
                        VStack(alignment: .center) {
                            HStack (alignment: .center, spacing: 56){
                                Text("\(babies.first?.name ?? "") Needs")
                                    .font(
                                        Font.custom("Nunito", size: 24)
                                            .weight(.semibold)
                                    )
                                    .kerning(0.24)
                                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 16)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            HStack{
                                Text(String(format: "%.2f", babies.last?.nutrition ?? 0))
                                    .font(
                                        Font.custom("Nunito", size: 48)
                                            .weight(.bold)
                                    )
                                    .kerning(0.48)
                                    .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                                
                                Text("ccal/day")
                                    .font(
                                        Font.custom("Nunito", size: 32)
                                            .weight(.semibold)
                                    )
                                    .frame(width: 120, height: 40, alignment: .center)
                                    .kerning(0.32)
                                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                
                                Image(systemName: "info.circle")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                
                            }
                            .frame(width: 326, height: 56, alignment: .center)
                            
                            Spacer().frame(height: 16)
                            
                            HStack{
                                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                                    HStack (alignment: .center, spacing: 4){
                                        Image(systemName: "bell")
                                            .font(.system(size: 24))
                                            .foregroundColor(.green)
                                        
                                        TextCarbsFatProteinView(labelText: "Carbs")
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    
                                    .padding(.leading, 16)
                                    
                                    HStack (alignment: .center, spacing: 2.97933){
                                        Text(resultTextCarbs)
                                            .font(Font.custom("Inter", size: 12))
                                            .kerning(0.2)
                                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    .padding(.top, 1)
                                    
                                    .padding(.leading, 16)
                                }
                                
                                Spacer()
                                
                                VStack{
                                    HStack (alignment: .center, spacing: 4){
                                        Image(systemName: "bell")
                                            .font(.system(size: 24))
                                            .foregroundColor(.green)
                                        
                                        TextCarbsFatProteinView(labelText: "Fat")
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    
                                    HStack (alignment: .center, spacing: 2.97933){
                                        Text(resultTextFat)
                                            .font(Font.custom("Inter", size: 12))
                                            .kerning(0.2)
                                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    .padding(.top, 1)
                                }
                                
                                Spacer()
                                
                                VStack{
                                    HStack (alignment: .center, spacing: 4){
                                        Image(systemName: "bell")
                                            .font(.system(size: 24))
                                            .foregroundColor(.green)
                                        
                                        TextCarbsFatProteinView(labelText: "Protein")
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    
                                    .padding(.trailing, 16)
                                    
                                    HStack (alignment: .center, spacing: 2.97933){
                                        Text(resultTextProtein)
                                            .font(Font.custom("Inter", size: 12))
                                            .kerning(0.2)
                                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                    }
                                    .padding(0)
                                    .frame(width: 105, alignment: .center)
                                    .padding(.top, 1)
                                    
                                    .padding(.trailing, 16)
                                }
                            }
                            
                            Spacer().frame(height: 16)
                            
                            HStack (alignment: .center, spacing: 4){
                                Image(systemName: "info.circle")
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)
                                
                                Text("Find out how we do the calculations.")
                                    .font(Font.custom("Inter", size: 11))
                                    .kerning(0.5)
                                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                
                                Text("Learn more here.")
                                    .font(Font.custom("Inter", size: 11))
                                    .kerning(0.5)
                                    .underline()
                                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                                    .bold()
                            }
                        }
                        
                        .padding(.vertical, 24.43835)
                        .frame(maxWidth: .infinity, minHeight: 223, maxHeight: 223, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 1)
                                .stroke(
                                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.25, green: 0.8, blue: 0.59), Color(red: 0.93, green: 0.98, blue: 0.96)]), startPoint: .top, endPoint: .bottom),
                                    lineWidth: 2
                                )
                        )
                        .shadow(color: Color(red: 0.18, green: 0.56, blue: 0.42).opacity(0.20), radius: 2, x: 0, y: 0)
                        
                        .padding(.horizontal, 16)
                        
                        Spacer().frame(height: 20)
                        
                        VStack(alignment: .leading) {
                            VStack (alignment: .leading){
                                Text("Enjoy Stress-Free Weaning")
                                    .frame(width: 304, height: 32)
                                    .font(
                                        Font.custom("Nunito", size: 24)
                                            .weight(.semibold)
                                    )
                                    .kerning(0.24)
                                    .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                                
                                Spacer().frame(height: 4)
                                
                                Text("Reimagine mealtimes with our expertly curated kits, tailored to your baby's individual nutritional needs.")
                                    .font(Font.custom("Inter", size: 12))
                                    .kerning(0.2)
                                    .foregroundColor(Color(red: 0.13, green: 0.16, blue: 0.16))
                                    .frame(width: 326, height: 32 , alignment: .leading)
                            }
                            .frame(width: 326, height: 68)
                            
                            Spacer().frame(height: 16)
                            
                            HStack(alignment: .center, spacing: 4) {
                                Text("Start Feeding")
                                  .font(
                                    Font.custom("Inter", size: 14)
                                      .weight(.medium)
                                  )
                                  .kerning(0.4)
                                  .multilineTextAlignment(.center)
                                  .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                            .frame(height: 36, alignment: .center)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay(
                              RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.16, green: 0.49, blue: 0.36), lineWidth: 1)
                            )
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .padding(.bottom, 16)
                        .frame(width: 358, height: 148, alignment: .leading)
                        .background(
                        LinearGradient(
                        stops: [
                        Gradient.Stop(color: Color(red: 0.93, green: 0.98, blue: 0.96), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.69, green: 0.92, blue: 0.83), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.57, y: 1),
                        endPoint: UnitPoint(x: 1.07, y: 1)
                        )
                        )
                        .cornerRadius(8)
                        
                        .padding(.horizontal, 16)
                        
                        Spacer().frame(height: 20)
                        
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
                                ForEach(menu, id: \.self) { menuItem in
                                    RecommendationItemView(name: menuItem)
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
                        
                        CategoryItemView()
                        
                        Text("Hello, \(babies.first?.name ?? "")!")
                        Text("Nutrition Need: " + String(format: "%.2f", babies.first?.nutrition ?? 0))
                            .padding(.bottom, 20)
                        
                        Text("Z-Score").padding(.bottom, 5)
                        HStack{
                            Spacer()
                            VStack{
                                Text("Weight").font(.system(size: 12)).fontWeight(.bold)
                                Text(zscore.statusZscoreWeight(zscore: babies.first?.zscore[0] ?? 0).rawValue).font(.system(size: 12))
                                Text(String(format: "%.2f", babies.first?.zscore[0] ?? 0)).font(.system(size: 12))
                            }
                            Spacer()
                            VStack{
                                Text("Height").font(.system(size: 12)).fontWeight(.bold)
                                Text(zscore.statusZscoreHeight(zscore: babies.first?.zscore[1] ?? 0).rawValue).font(.system(size: 12))
                                Text(String(format: "%.2f", babies.first?.zscore[1] ?? 0)).font(.system(size: 12))
                            }
                            Spacer()
                            VStack{
                                Text("Head").font(.system(size: 12)).fontWeight(.bold)
                                Text(zscore.statusZscoreHead(zscore: babies.first?.zscore[2] ?? 0).rawValue).font(.system(size: 12))
                                Text(String(format: "%.2f", babies.first?.zscore[2] ?? 0)).font(.system(size: 12))
                            }
                            Spacer()
                        }.padding(.bottom, 10)
                        
                        Spacer()
                        VStack{
                            Button{
                                
                            } label: {
                                NavigationLink(destination: ContentView()){
                                    Text("Input Data Baby")
                                }
                            }
                        }
                        
                    }
                }.navigationBarBackButtonHidden()
                    .onAppear{
                        firestoreManager.getBabiesData(){ fetchBabies in
                            self.babies = fetchBabies
                        }
                        
                        firestoreManager.getMenuRecommendation() { fetchMenu in
                            self.menu = fetchMenu
                        }
                    }
            }
            .tabItem{
                Image(systemName: "star")
                Text("Summary")
            }
            
            MenuView()
                .tabItem {
                    Image(systemName: "star")
                    Text("My Menu")
            }
            
            Text("Progress")
                            .tabItem {
                                Image(systemName: "star")
                                Text("Progress")
            }
            
            Text("Profile")
                            .tabItem {
                                Image(systemName: "star")
                                Text("Profile")
            }
        }
        .navigationBarBackButtonHidden()
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
