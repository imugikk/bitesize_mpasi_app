//
//  ProgressGrowthView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 11/11/23.
//

import SwiftUI
import Charts

struct ProgressGrowthView: View {
    
    @State var preselectedIndex = 0
    @State private var isShowingAddDataSheet = false
    var tabMenu = ["Growth Chart", "History"]
    @State var tabIndex = 0
    let color = Color(red: 0.16, green: 0.49, blue: 0.36)
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    var body: some View {
        return ScrollView{
            VStack{
                HStack{
                    ForEach(tabMenu.indices, id:\.self) { index in
                        let selectedIndex = tabIndex == index
                        ZStack{
                            Rectangle()
                                .fill(color.opacity(0))
                            
                            Rectangle()
                                .fill(color)
                                .cornerRadius(20)
                            
                                .opacity(selectedIndex ? 1 : 0.01)
                                .onTapGesture {
                                    withAnimation(.interactiveSpring(response: 0.2,
                                                                     dampingFraction: 2,
                                                                     blendDuration: 0.5)) {
                                        tabIndex = index
                                    }
                                }
                        }
                        .overlay(
                            Text(tabMenu[index])
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(selectedIndex ? .white : Color(red: 0.16, green: 0.49, blue: 0.36))
                        )
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(
                    Rectangle()
                        .fill(.white)
                )
                
                if(tabIndex == 0){
                    CustomSegmentedGrowthControl(preselectedIndex: $preselectedIndex, options: ["Weight", "Height", "Head Circ."])
                } else {
                    CustomHistoryControl()
                }
                
                Spacer()
            }
            .navigationTitle("Detail")
            .navigationBarItems(trailing: tabIndex == 1 ? AddDataButton : nil)
            .sheet(isPresented: $isShowingAddDataSheet) {
                // Content of your sheet goes here...
                AddDataSheet(onDismiss: {
                    isShowingAddDataSheet = false
                    firestoreManager.reloadData()
                })
            }
        }
    }
    
    var AddDataButton: some View {
        Button("Add Data") {
            isShowingAddDataSheet = true
        }
    }
}

struct CustomSegmentedGrowthControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color(red: 0.16, green: 0.49, blue: 0.36)
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    @State private var babies: [Babies] = []
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 10) {
                ForEach(options.indices, id:\.self) { index in
                    let isSelected = preselectedIndex == index
                    ZStack {
                        Rectangle()
                            .fill(color.opacity(0))
                        
                        Rectangle()
                            .fill(color)
                            .cornerRadius(20)
                            .opacity(isSelected ? 1 : 0.01)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.2,
                                                                 dampingFraction: 2,
                                                                 blendDuration: 0.5)) {
                                    preselectedIndex = index
                                }
                            }
                    }
                    .overlay(
                        Text(options[index])
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(isSelected ? .white : Color(red: 0.16, green: 0.49, blue: 0.36))
                    )
                }
            }
            .frame(height: 32)
            .cornerRadius(20)
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            GraphView(source: "b_age_length.csv")
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
            Text("About Growth Chart")
                .font(
                    Font.custom("Nunito-SemiBold", size: 24)
                    
                )
                .padding(.horizontal, 16)
                .padding(.top, 20)
            Text("A growth chart is used by pediatricians and other health care providers to follow a child's growth over time. Growth charts have been constructed by observing the growth of large numbers of healthy children over time. The height, weight, and head circumference of a child can be compared to the expected parameters of children of the same age and sex to determine whether the child is growing appropriately. Growth charts can also be used to predict the expected adult height and weight of a child because, in general, children maintain a fairly constant growth curve. When a child deviates from his or her previously established growth curve, investigation into the cause is generally warranted. Parameters used to analyze growth charts include weight velocity (defined as rate of change in weight over time), height velocity (defined as rate of change in stature over time), and whether someone's growth chart crosses percentiles. For instance, endocrine disorders can be associated with a decrease in height velocity and preserved weight velocity while normal growth variants are associated with a decrease in height and weight velocity that are proportional to each other. It's important to note that other parameters are more commonly used such as waist circumference for assessing obesity and skin fold difference for assessing malnutrition. Growth charts can also be compiled with a portion of the population deemed to have been raised in more or less ideal environments, such as nutrition that conforms to pediatric guidelines, and no maternal smoking. Charts from these sources end up with slightly taller but thinner averages")
                .font(Font.custom("Inter-Regular", size: 16))
                .padding(.horizontal, 16)
                .padding(.top, 15)
        }
        .onAppear{
            firestoreManager.getBabiesData(){ fetchBabies in
                self.babies = fetchBabies
            }
            
        }
    }
    
}

struct CustomHistoryControl: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    @State private var babies: [Babies] = []
    
    var body: some View {
        VStack{
            HStack{
                Text("Date").font(.system(size: 12)).padding(.trailing, 30)
                Text("Age (Months)").font(.system(size: 12))
                Text("Weights (Kg)").font(.system(size: 12))
                Text("Heights (Cm)").font(.system(size: 12))
                Text("Head Circ. (Cm)").font(.system(size: 12))
            }.padding(.bottom, 8)
            HStack{
                VStack(alignment: .leading){
                    ForEach(babies.first?.timeMeasure ?? [], id: \.self) { date in
                        Text("(\(DateFormatter.localizedString(from: date, dateStyle: .short, timeStyle: .none)))").font(.system(size: 12))
                    }
                    Spacer()
                }.padding(.bottom, 8)
                Spacer()
                VStack(alignment: .leading){
                    ForEach(babies.first?.timeMeasure ?? [], id: \.self) { date in
                        Text("5").font(.system(size: 12))
                    }
                    Spacer()
                }.padding(.bottom, 8)
                Spacer()
                VStack(alignment: .leading){
                    ForEach(babies.first?.weight ?? [], id: \.self) { date in
                        Text(String(format: "%.1f", date)).font(.system(size: 12))
                    }
                    Spacer()
                }.padding(.bottom, 8)
                Spacer()
                VStack(alignment: .leading){
                    ForEach(babies.first?.height ?? [], id: \.self) { date in
                        Text(String(format: "%.1f", date)).font(.system(size: 12))
                    }
                    Spacer()
                }.padding(.bottom, 8)
                Spacer()
                VStack(alignment: .leading){
                    ForEach(babies.first?.hc ?? [], id: \.self) { date in
                        Text(String(format: "%.1f", date)).font(.system(size: 12))
                    }
                    Spacer()
                }.padding(.bottom, 8)
            }.padding(.horizontal, 8)
        }
        .padding()
        .onAppear{
            firestoreManager.getBabiesData(){ fetchBabies in
                self.babies = fetchBabies
            }
        }
    }
}
