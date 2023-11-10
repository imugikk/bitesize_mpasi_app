//
//  ProgressView.swift
//  bitesize
//
//  Created by Michelle Annice on 01/11/23.
//

import SwiftUI

struct ProgressView: View {
    
    @State private var selectedOption = 0
    @State private var selectedSegment: Int?
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var babies: [Babies] = []
    @State private var menu: [String] = []
    @State private var zScoreView: [Double] = []
    
    @State var preselectedIndex = 0
    

    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            ScrollView{
            VStack{
                SummaryCardView().frame(width: 358, height: 228)
                    .environmentObject(firestoreManager)
                
                HStack(alignment: .center) {
                // Space Between
                    Text("Growth")
                    .font(
                    Font.custom("Nunito", size: 24)
                    .weight(.semibold)
                    )
                    .kerning(0.24)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))

                    .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                    .padding(.bottom, 24)
                
                    NavigationLink(destination: ProgressGrowthView()){
                        Text("See All")
                        .font(
                            Font.custom("Inter", size: 14)
                            .weight(.medium)
                        )
                        .kerning(0.4)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 24)
                
                
                VStack{
                    LazyHStack(spacing: 0) {
                        Button(action: {
                            selectedSegment = 0
                        }) {
                            HStack {
                                Text("Weight")
                            }
                            .modifier(TextButtonStyle(selectedSegment: selectedSegment, tag: 0))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            selectedSegment = 1
                        }) {
                            HStack {
                                Text("Height")
                            }
                            .modifier(TextButtonStyle(selectedSegment: selectedSegment, tag: 1))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            selectedSegment = 2
                        }) {
                            HStack {
                                Text("Head Circumference")
                            }
                            .modifier(TextButtonStyle(selectedSegment: selectedSegment, tag: 2))
                        }
                    }
                    
                    // Add views based on the selected segment
                    if selectedSegment == 0 {
                        WeightView()
                    } else if selectedSegment == 1 {
                        HeightView()
                    } else if selectedSegment == 2 {
                        HeadView()
                    }
                    
//                    Spacer()
                }
                
//                Spacer()
                
                VStack{
                    HStack(alignment: .center) {
                        // Space Between
                        Text("FAQs")
                            .font(
                                Font.custom("Nunito", size: 24)
                                    .weight(.semibold)
                            )
                            .kerning(0.24)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        
                            .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                        
                        Spacer()
                        // Alternative Views and Spacers
                        
                        Text("See All")
                            .font(
                                Font.custom("Inter", size: 14)
                                    .weight(.medium)
                            )
                            .kerning(0.4)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 24)
                    
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 311, height: 182)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(8)
                        
                        HStack{
                            Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 156, height: 174)
                            .background(
                            Image("orang")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 156, height: 174)
                            .clipped()
                            )
                            
                            VStack{
                                
                                Text("What is Z-Score")
                                  .font(
                                    Font.custom("Nunito", size: 28)
                                      .weight(.semibold)
                                  )
                                  .kerning(0.28)
                                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                  .frame(width: 128, alignment: .leading)
                                
                                Text("By Dr. Mei")
                                  .font(Font.custom("Inter", size: 12))
                                  .kerning(0.2)
                                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                                  .frame(width: 128, alignment: .leading)
                                
                                
                            }
                        }
                    }
                    
//                    Spacer()
                }
                    
//                Spacer()
            }
            .onAppear{
                selectedSegment = 0
            }
            }

        }
    }
}

//#Preview {
//    ProgressView()
//}
