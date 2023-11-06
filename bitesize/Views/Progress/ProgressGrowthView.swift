//
//  ProgressGrowthView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 08/11/23.
//

import SwiftUI
import Charts

struct ProgressGrowthView: View {
    
    @State var preselectedIndex = 0
    var tabMenu = ["Growth Chart", "History"]
    @State var tabIndex = 0
    let color = Color(red: 0.16, green: 0.49, blue: 0.36)
    
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
        }
    }
}

var AddDataButton: some View {
    HStack {
        Button(action: {}) {
            Text("Add Data")
        }
    }
}

struct CustomSegmentedGrowthControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color(red: 0.16, green: 0.49, blue: 0.36)
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
            
            Chart {
                BarMark(x: .value("Day", "Jun 1"), y: .value("Value", 50))
            } 
            .frame(height: 400)
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
            Text("About Growth Chart")
                .font(
                    Font.custom("Nunito", size: 24)
                    .weight(.semibold)
                )
                .padding(.horizontal, 16)
                .padding(.top, 20)
            Text("A growth chart is used by pediatricians and other health care providers to follow a child's growth over time. Growth charts have been constructed by observing the growth of large numbers of healthy children over time. The height, weight, and head circumference of a child can be compared to the expected parameters of children of the same age and sex to determine whether the child is growing appropriately. Growth charts can also be used to predict the expected adult height and weight of a child because, in general, children maintain a fairly constant growth curve. When a child deviates from his or her previously established growth curve, investigation into the cause is generally warranted. Parameters used to analyze growth charts include weight velocity (defined as rate of change in weight over time), height velocity (defined as rate of change in stature over time), and whether someone's growth chart crosses percentiles. For instance, endocrine disorders can be associated with a decrease in height velocity and preserved weight velocity while normal growth variants are associated with a decrease in height and weight velocity that are proportional to each other. It's important to note that other parameters are more commonly used such as waist circumference for assessing obesity and skin fold difference for assessing malnutrition. Growth charts can also be compiled with a portion of the population deemed to have been raised in more or less ideal environments, such as nutrition that conforms to pediatric guidelines, and no maternal smoking. Charts from these sources end up with slightly taller but thinner averages")
                .font(Font.custom("Inter", size: 16))
                .padding(.horizontal, 16)
                .padding(.top, 15)
        }
    }
}

struct CustomHistoryControl: View {
    var body: some View {
        VStack{
            
        }
    }
}
