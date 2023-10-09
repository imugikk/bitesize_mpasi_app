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
    @State private var zScoreView: [Double] = []
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
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
                        firestoreManager.getMenuesData(){ fetchMenu in
                            self.menu = fetchMenu
                        }
                    } label: {
                        Text("Rekomendasi Menu")
                    }.padding()
                    
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
            firestoreManager.getBabiesData(forUserId: "user_1"){ fetchBabies in
                self.babies = fetchBabies
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
