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
    
    @State var segmentedChoice = 0
    @State private var selectedOption = 0
    @State private var selectedSegment: Int = 0
  
    @State var selectedIndex: Int = 0

    let titles: [String] =
        ["Growth Chart",
         "History"
        ]
    
    
    
    var body: some View {
//        return 
        
//        SegmentedControlView(selectedIndex: $selectedIndex, titles: titles)
//        ScrollView{
            VStack{
                
                Picker("", selection: $segmentedChoice){
                    Text("Growth Chart").tag(0)
                    Text("History").tag(1)
                    
                }.padding()
                    .pickerStyle(SegmentedPickerStyle())
                
            }
//            .frame(height: 30, alignment: .center)
            .navigationTitle("Detail")
            .navigationBarItems(trailing: tabIndex == 1 ? AddDataButton : nil)
            .sheet(isPresented: $isShowingAddDataSheet) {
                // Content of your sheet goes here...
                AddDataSheet(onDismiss: {
                    isShowingAddDataSheet = false
                    firestoreManager.reloadData()
                })
            }
            
            
            if(segmentedChoice == 0){
                CustomSegmentedGrowthControl(preselectedIndex: $preselectedIndex, options: ["Weight", "Height", "Head Circ."])
            }
            
            if(segmentedChoice == 1){
                CustomHistoryControl()
            }
            
            Spacer()
            
//        }
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
    
    @State var segmentedChoice = 0
    @State private var selectedOption = 0
    @State private var selectedSegment: Int = 0
    
    var body: some View {
        
        
            VStack {
                LazyHStack(spacing: 0){
                    Button(action: {
                        selectedSegment = 0
                    }) {
                        HStack {
                            Text("Weight")
                        }
                        .modifier(TextButtonStyle3(selectedSegment: selectedSegment, tag: 0))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        selectedSegment = 1
                    }) {
                        HStack {
                            Text("Height")
                        }
                        .modifier(TextButtonStyle3(selectedSegment: selectedSegment, tag: 1))
                    }
                    
                    Spacer()
                    
                    
                    Button(action: {
                        selectedSegment = 2
                    }) {
                        HStack {
                            Text("Head Circumference")
                        }
                        .modifier(TextButtonStyle3(selectedSegment: selectedSegment, tag: 2))
                    }
                    
                    Spacer()
                    
                }
            }
            .frame(height: 30, alignment: .center)
            
            if(selectedSegment == 0){
                GrowthGraphWeight()
            }
            
            if(selectedSegment == 1){
                GrowthGraphHeight()
            }
            
            if(selectedSegment == 2){
                GrowthGraphHeadCircumference()
            }
        
            
            Spacer()
        
        
        //TAMPILAN GRAPH
//        VStack(alignment: .leading){
//            HStack(spacing: 10) {
//                ForEach(options.indices, id:\.self) { index in
//                    let isSelected = preselectedIndex == index
//                    ZStack {
//                        Rectangle()
//                            .fill(color.opacity(0))
//                        
//                        Rectangle()
//                            .fill(color)
//                            .cornerRadius(20)
//                            .opacity(isSelected ? 1 : 0.01)
//                            .onTapGesture {
//                                withAnimation(.interactiveSpring(response: 0.2,
//                                                                 dampingFraction: 2,
//                                                                 blendDuration: 0.5)) {
//                                    preselectedIndex = index
//                                }
//                            }
//                    }
//                    .overlay(
//                        Text(options[index])
//                            .font(.system(size: 16))
//                            .fontWeight(.medium)
//                            .foregroundColor(isSelected ? .white : Color(red: 0.16, green: 0.49, blue: 0.36))
//                    )
//                }
//            }
//            .frame(height: 32)
//            .cornerRadius(20)
//            .padding(.horizontal, 16)
//            .padding(.top, 8)
//            
//            GraphView(source: "b_age_length.csv")
//            .padding(.top, 20)
//            .padding(.horizontal, 16)
//            
//            Text("About Growth Chart")
//                .font(
//                    Font.custom("Nunito-SemiBold", size: 24)
//                    
//                )
//                .padding(.horizontal, 16)
//                .padding(.top, 20)
//            Text("A growth chart is used by pediatricians and other health care providers to follow a child's growth over time. Growth charts have been constructed by observing the growth of large numbers of healthy children over time. The height, weight, and head circumference of a child can be compared to the expected parameters of children of the same age and sex to determine whether the child is growing appropriately. Growth charts can also be used to predict the expected adult height and weight of a child because, in general, children maintain a fairly constant growth curve. When a child deviates from his or her previously established growth curve, investigation into the cause is generally warranted. Parameters used to analyze growth charts include weight velocity (defined as rate of change in weight over time), height velocity (defined as rate of change in stature over time), and whether someone's growth chart crosses percentiles. For instance, endocrine disorders can be associated with a decrease in height velocity and preserved weight velocity while normal growth variants are associated with a decrease in height and weight velocity that are proportional to each other. It's important to note that other parameters are more commonly used such as waist circumference for assessing obesity and skin fold difference for assessing malnutrition. Growth charts can also be compiled with a portion of the population deemed to have been raised in more or less ideal environments, such as nutrition that conforms to pediatric guidelines, and no maternal smoking. Charts from these sources end up with slightly taller but thinner averages")
//                .font(Font.custom("Inter-Regular", size: 16))
//                .padding(.horizontal, 16)
//                .padding(.top, 15)
//        }
//        .onAppear{
//            firestoreManager.getBabiesData(){ fetchBabies in
//                self.babies = fetchBabies
//            }
//            
//        }
    }
    
}
// END TAMPILAN GRAPH

struct CustomHistoryControl: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    @State private var babies: [Babies] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 4){
                
                Text("Date")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
       
                Text("Age (Months)")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
                

                Text("Weights (Kg)")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
            
                Text("Heights (Cm)")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
     
                Text("Head Circ..(Cm)")
                  .font(Font.custom("Inter-Regular", size: 12))
                  .kerning(0.2)
                  .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                  .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .top)
            Divider()
            HStack{
                VStack(alignment: .leading){
                    ForEach(babies.first?.timeMeasure ?? [], id: \.self) { date in
                        Text("(\(DateFormatter.localizedString(from: date, dateStyle: .short, timeStyle: .none)))")
                            .font(Font.custom("Inter-Regular", size: 11))
                            .kerning(0.08)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 31, maxHeight: 31, alignment: .leading)
                    }
                    Spacer()
                }.padding(.bottom, 8)
                Spacer()
                VStack(alignment: .leading){
                    ForEach(babies.first?.timeMeasure ?? [], id: \.self) { date in
                        Text("5")
                            .font(Font.custom("Inter-Regular", size: 14))
                            .kerning(0.08)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 31, maxHeight: 31, alignment: .leading)
                    }
                    Spacer()
                }.padding(.bottom, 8)
                Spacer()
                VStack(alignment: .leading){
                    ForEach(babies.first?.weight ?? [], id: \.self) { date in
                        Text(String(format: "%.1f", date))
                            .font(Font.custom("Inter-Regular", size: 14))
                            .kerning(0.08)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 31, maxHeight: 31, alignment: .leading)
                    }
                    Spacer()
                }.padding(.bottom, 8)
                Spacer()
                VStack(alignment: .leading){
                    ForEach(babies.first?.height ?? [], id: \.self) { date in
                        Text(String(format: "%.1f", date))
                            .font(Font.custom("Inter-Regular", size: 14))
                            .kerning(0.08)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 31, maxHeight: 31, alignment: .leading)
                    }
                    Spacer()
                }.padding(.bottom, 8)
                Spacer()
                VStack(alignment: .leading){
                    ForEach(babies.first?.hc ?? [], id: \.self) { date in
                        Text(String(format: "%.1f", date))
                            .font(Font.custom("Inter-Regular", size: 14))
                            .kerning(0.08)
                            .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            .frame(maxWidth: .infinity, minHeight: 31, maxHeight: 31, alignment: .leading)
                    }
                    Spacer()
                }.padding(.bottom, 8)
            }.padding(.horizontal, 8)
        }
        .padding(16)
        .frame(width: 358, height: 158, alignment: .topLeading)
//        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(8)
        
        .onAppear{
            firestoreManager.getBabiesData(){ fetchBabies in
                self.babies = fetchBabies
            }
        }
    }
}


struct TextButtonStyle3: ViewModifier {
    var selectedSegment: Int?
    var tag: Int

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .font(Font.custom("Inter-Medium", size: 16))
            .kerning(0.2)
            .multilineTextAlignment(.center)
            .foregroundColor(selectedSegment == tag ? Color.white : Color(red: 0.16, green: 0.49, blue: 0.36))
            .background(selectedSegment == tag ? Color(red: 0.16, green: 0.49, blue: 0.36) : Color.clear)
            .cornerRadius(16)
    }
}


struct TextButtonStyleTab: ViewModifier {
    var selectedSegment: Int?
    var tag: Int

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .font(Font.custom("Inter-Medium", size: 16))
            .kerning(0.2)
            .multilineTextAlignment(.center)
            .foregroundColor(selectedSegment == tag ? Color.white : Color(red: 0.16, green: 0.49, blue: 0.36))
            .background(selectedSegment == tag ? Color(red: 0.16, green: 0.49, blue: 0.36) : Color.clear)
            .cornerRadius(16)
    }
}
