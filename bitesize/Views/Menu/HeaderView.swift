//
//  HeaderView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/10/23.
//

import SwiftUI

struct HeaderView: View {
    @StateObject var weekStore = WeekStore()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State private var tappedIndex: Int = 0
    
    @Binding var totalCalories: Double
    @Binding var clearSelection: Bool
    @Binding var currentDay: Int

    var body: some View {
        ZStack {
            ForEach(weekStore.allWeeks) { week in
                VStack{
                    HStack{
                        Text(
                            weekStore.dateToString(date: week.date[0], format: "MMM d") + " - " +  weekStore.dateToString(date: week.date[6], format: "MMM d")
                        )
                        Spacer()
                        Text("See All")
                            .font(
                                Font.custom("Inter", size: 14)
                                .weight(.medium)
                            )
                            .kerning(0.4)
                            .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                    }.padding(.bottom, 8)
                    .padding(.horizontal, 10)
                    .frame(width: UIScreen.main.bounds.width)
                    .background(
                        Rectangle()
                            .fill(.white)
                    )
                    HStack {
                        ForEach(0..<7) { index in
                            VStack() {
                                Text(weekStore.dateToString(date: week.date[index], format: "d"))
                                    .font(.system(size:14))
                                    .frame(maxWidth:.infinity)
                                    .foregroundColor(tappedIndex == index ? Color(red: 0.16, green: 0.49, blue: 0.36) : .black)
                                    .padding(.top, 8)
                                Rectangle()
                                .frame(height: 2)
                                .foregroundColor(tappedIndex == index ? Color(red: 0.16, green: 0.49, blue: 0.36) : Color.clear)
                            }
                            .onAppear{
                                if Calendar.current.isDate(week.date[index], inSameDayAs: weekStore.currentDate) {
                                    tappedIndex = index
                                }
                            }
                            .onTapGesture {
                                // Updating Current Day
                                weekStore.currentDate = week.date[index]
                                tappedIndex = index
                                totalCalories = 0
                                clearSelection.toggle()
                                currentDay = (Int(weekStore.dateToString(date: week.date[index], format: "d")) ?? 0) % 7
                                print(currentDay)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(
                        Rectangle()
                            .fill(.white)
                    )
                }
                .offset(x: myXOffset(week.id), y: 0)
                .zIndex(1.0 - abs(distance(week.id)) * 0.1)
                .padding(.horizontal, 20)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 400
                }
                .onEnded { value in
                    withAnimation {
                        if value.predictedEndTranslation.width > 0 {
                            draggingItem = snappedItem + 1
                        } else {
                            draggingItem = snappedItem - 1
                        }
                        snappedItem = draggingItem
                        
                        weekStore.update(index: Int(snappedItem))
                    }
                }
        )
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(weekStore.allWeeks.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(weekStore.allWeeks.count) * distance(item)
        return sin(angle) * 200
    }
    
}


//#Preview {
//    HeaderView(totalCalories: .constant(2))
//}
