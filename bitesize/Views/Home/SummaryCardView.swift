//
//  SummaryCardView.swift
//  bitesize
//
//  Created by Michelle Annice on 01/11/23.
//

import SwiftUI

struct SummaryCardView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    let zscore = ZScoreCalculator()
    let calculator = CaloriesNeededCalculator()
    
    @State private var isShowingCaloriesSheet = false
    @State private var isShowingCalculationSheet = false
    @State private var isShowingEditSheet = false
    
    @State private var babies: [Babies] = []
    @State private var gizi: [Double] = []
    @State private var menu: [String] = []
    @State private var zScoreView: [Double] = []
    @Binding var refreshSummary: Bool
    
    
    var body: some View {
        let nutrition = babies.first?.nutrition.last ?? 0
        let lowerBoundCarbs = String(format: "%.0f", nutrition * 0.35 / 4)
        let upperBoundCarbs = String(format: "%.0f", nutrition * 0.60 / 4)
        let resultTextCarbs = "\(lowerBoundCarbs)~\(upperBoundCarbs)g"
        
        let lowerBoundFat = String(format: "%.0f", nutrition * 0.30 / 9)
        let upperBoundFat = String(format: "%.0f", nutrition * 0.45 / 9)
        let resultTextFat = "\(lowerBoundFat)~\(upperBoundFat)g"
        
        let lowerBoundProtein = String(format: "%.0f", nutrition * 0.10 / 4)
        let upperBoundProtein = String(format: "%.0f", nutrition * 0.15 / 4)
        let resultTextProtein = "\(lowerBoundProtein)~\(upperBoundProtein)g"
    
        //Target Card View
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center, spacing: 16) {
                    VStack(alignment: .center, spacing: 4) {
//                        
//                        Button {
//                            fetchData()
//                        } label: {
//                            Text("Refresh")
//                        }

                        
                        HStack (alignment: .center, spacing: 30){
                           
                            Text("\(babies.first?.name ?? "")'s Nutrition Need")
                                .font(
                                    Font.custom("Nunito-SemiBold", size: 24)
                                    
                                )
                                .kerning(0.24)
                                .padding(.top, 10)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            
                            Button(action:{
                                isShowingEditSheet.toggle()
                            }) {
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 16)
                            }
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .trailing)

                    
                        HStack(alignment: .center, spacing: 8) {
                            
                            Text(String(format: "%.0f", babies.first?.nutrition.last ?? 0))
                                .font(
                                    Font.custom("Nunito-Bold", size: 48)
                                    
                                )
                                .kerning(0.48)
                                .foregroundColor(Color(red: 0.18, green: 0.56, blue: 0.42))
                            
                            Text("ccal/day")
                                .font(
                                    Font.custom("Nunito-SemiBold", size: 32)
                                    
                                )
                                .frame(width: 130, height: 40, alignment: .center)
                                .kerning(0.32)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            
                            
                            Button(action: {
                                isShowingCaloriesSheet.toggle()
                            }) {
                                Image(systemName: "info.circle")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                            }.sheet(isPresented: $isShowingCaloriesSheet, onDismiss: didDismiss){
                                VStack(alignment: .leading){
                                    ZStack{
                                        HStack {
                                            Spacer()
                                            Text("Info")
                                                .font(
                                                    Font.custom("Inter-SemiBold", size: 16)
                                                    
                                                )
                                            Spacer() // Spacer to push the Image to the right
                                        }
                                        HStack{
                                            Spacer()
                                            Button(action: {
                                                isShowingCaloriesSheet.toggle()
                                            }){
                                                Image(systemName: "xmark.circle.fill")
                                                    .foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.37))
                                                    .frame(width: 16, height: 16)
                                            }
                                        }
                                    }
                                    .padding(.bottom, 18)
                                    VStack(alignment: .leading){
                                        Text("Calories")
                                            .font(
                                                Font.custom("Inter-Medium", size: 22)
                                                
                                            )
                                            .padding(.bottom, 12)
                                        Text("The app determines the estimated daily calorie target for weaning based on the baby’s age. The equation result provides the total calorie target for both breastmilk and weaning food. However, the app specifically displays and focuses on the amount of calories needed daily from weaning food.")
                                            .font(Font.custom("Inter", size: 12))
                                            .padding(.bottom, 12)
                                        Text("Daily Calories Target*")
                                            .font(
                                                Font.custom("Inter-Medium", size: 14)
                                                
                                            )
                                            .padding(.bottom, 10)
                                        VStack(alignment: .leading){
                                            Text("4-6 months = (89 x weight [kg] – 100) + 56")
                                            Text("7-12 months = (89 x weight [kg] – 100) + 22")
                                            Text("13-35 months = (89 x weight [kg] – 100) + 20")
                                        }
                                        .font(Font.custom("Inter", size: 12))
                                        .padding(.bottom, 12)
                                        
                                        Text("Breastmilk to Weaning Food Ratio**")
                                            .font(
                                                Font.custom("Inter-Medium", size: 14)
                                                
                                            )
                                            .padding(.bottom, 10)
                                        
                                        VStack(alignment: .leading){
                                            Text("6-8 months = 70% Breastmilk and 30% Weaning Food")
                                            Text("9-11 months = 50% Breastmilk and 50% Weaning Food")
                                            Text("12-24 months = 30% Breastmilk and 70% Weaning Food")
                                        }
                                        .font(Font.custom("Inter-Regular", size: 12))
                                        .padding(.bottom, 12)
                                        
                                        VStack(alignment: .leading){
                                            Text("Source:")
                                                .font(Font.custom("Inter", size: 12))
                                            Text("*International Lactation Consultant Association (2013)")
                                                .font(Font.custom("Inter", size: 12))
                                                .foregroundColor(Color(red: 0.24, green: 0.28, blue: 0.28))
                                            Text("**Ikatan Dokter Anak Indonesia (2017)")
                                                .font(Font.custom("Inter", size: 12))
                                                .foregroundColor(Color(red: 0.24, green: 0.28, blue: 0.28))
                                        }
                                    }
                                    .padding(16)
                                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                    .cornerRadius(8)
                                }
                                .padding(14)
                                .presentationDetents([.medium])
                                .presentationContentInteraction(.scrolls)
                                .presentationBackgroundInteraction(.enabled)
                            }
                            
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .center)

                      
                        
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .center)
                   
                    
                    
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .center)
               
                
                HStack(alignment: .top) {
                  // Space Between
                    VStack(alignment: .center, spacing: 4) {
                        HStack(alignment: .center, spacing: 4) {
                            Image("carbo")
                                .font(.system(size: 24))
                                .foregroundColor(.green)
                            
                            TextCarbsFatProteinView(labelText: "Carbs")
                            
                        }
                        .padding(0)
                        .frame(width: 105, alignment: .center)
                        
                        HStack(alignment: .bottom, spacing: 2.97933) {
                            
                            Text(gizi == [] ? resultTextCarbs : String(format: "%.1f", gizi[0]) + "g")
                                .font(Font.custom("Inter-Regular", size: 12))
                                .kerning(0.2)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        }
                        .padding(0)
                        .frame(width: 105.36054, alignment: .bottom)
                        
                    }
                    .padding(0)
                    .frame(width: 105, alignment: .center)
                  Spacer()
                  // Alternative Views and Spacers
                    VStack(alignment: .center, spacing: 4) {
                        HStack(alignment: .center, spacing: 4) {
                            Image("fat")
                                .font(.system(size: 24))
                                .foregroundColor(.green)
                            
                            TextCarbsFatProteinView(labelText: "Fat")
                            
                        }
                        .padding(0)
                        .frame(width: 105, alignment: .center)
                        
                        HStack(alignment: .bottom, spacing: 2.97933) {
                            Text(gizi == [] ? resultTextFat : String(format: "%.1f", gizi[1]) + "g")
                                .font(Font.custom("Inter-Regular", size: 12))
                                .kerning(0.2)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                        }
                        .padding(0)
                        .frame(width: 105.36054, alignment: .bottom)
                        
                        
                    }
                    .padding(0)
                    .frame(width: 105, alignment: .center)
                  
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 4) {
                        HStack(alignment: .center, spacing: 4) {
                            Image("protein")
                                .font(.system(size: 24))
                                .foregroundColor(.green)
                            
                            TextCarbsFatProteinView(labelText: "Protein")
                            
                        }
                        .padding(0)
                        .frame(width: 105, alignment: .center)
                        
                        HStack(alignment: .bottom, spacing: 2.97933) {
                            Text(gizi == [] ? resultTextProtein : String(format: "%.1f", gizi[2]) + "g")
                                .font(Font.custom("Inter", size: 12))
                                .kerning(0.2)
                                .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                            
                        }
                        .padding(0)
                        .frame(width: 105.36054, alignment: .bottom)
                    }
                    .padding(0)
                    .frame(width: 105, alignment: .center)
                
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .top)
                
                
                HStack(alignment: .top, spacing: 4) {
                    HStack(alignment: .top, spacing: 0) {
                        Button(action: {
                            isShowingCaloriesSheet.toggle()
                        }){
                            Image(systemName: "info.circle")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        }.sheet(isPresented: $isShowingCaloriesSheet, onDismiss: didDismiss){
                            VStack(alignment: .leading){
                                ZStack{
                                    HStack {
                                        Spacer()
                                        Text("Info")
                                            .font(
                                                Font.custom("Inter", size: 16)
                                                    .weight(.semibold)
                                            )
                                        Spacer() // Spacer to push the Image to the right
                                    }
                                    HStack{
                                        Spacer()
                                        Button(action: {
                                            isShowingCaloriesSheet.toggle()
                                        }){
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.37))
                                                .frame(width: 16, height: 16)
                                        }
                                    }
                                }
                                .padding(.bottom, 18)
                                VStack(alignment: .leading){
                                    Text("Calories")
                                        .font(
                                            Font.custom("Inter", size: 22)
                                                .weight(.medium)
                                        )
                                        .padding(.bottom, 12)
                                    Text("The app determines the estimated daily calorie target for weaning based on the baby’s age. The equation result provides the total calorie target for both breastmilk and weaning food. However, the app specifically displays and focuses on the amount of calories needed daily from weaning food.")
                                        .font(Font.custom("Inter", size: 12))
                                        .padding(.bottom, 12)
                                    Text("Daily Calories Target*")
                                        .font(
                                            Font.custom("Inter", size: 14)
                                                .weight(.medium)
                                        )
                                        .padding(.bottom, 10)
                                    VStack(alignment: .leading){
                                        Text("4-6 months = (89 x weight [kg] – 100) + 56")
                                        Text("7-12 months = (89 x weight [kg] – 100) + 22")
                                        Text("13-35 months = (89 x weight [kg] – 100) + 20")
                                    }
                                    .font(Font.custom("Inter", size: 12))
                                    .padding(.bottom, 12)
                                    
                                    Text("Breastmilk to Weaning Food Ratio**")
                                        .font(
                                            Font.custom("Inter", size: 14)
                                                .weight(.medium)
                                        )
                                        .padding(.bottom, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text("6-8 months = 70% Breastmilk and 30% Weaning Food")
                                        Text("9-11 months = 50% Breastmilk and 50% Weaning Food")
                                        Text("12-24 months = 30% Breastmilk and 70% Weaning Food")
                                    }
                                    .font(Font.custom("Inter", size: 12))
                                    .padding(.bottom, 12)
                                    
                                    VStack(alignment: .leading){
                                        Text("Source:")
                                            .font(Font.custom("Inter", size: 12))
                                        Text("*International Lactation Consultant Association (2013)")
                                            .font(Font.custom("Inter", size: 12))
                                            .foregroundColor(Color(red: 0.24, green: 0.28, blue: 0.28))
                                        Text("**Ikatan Dokter Anak Indonesia (2017)")
                                            .font(Font.custom("Inter", size: 12))
                                            .foregroundColor(Color(red: 0.24, green: 0.28, blue: 0.28))
                                    }
                                }
                                .padding(16)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(8)
                            }
                            .padding(14)
                            .presentationDetents([.medium])
                            .presentationContentInteraction(.scrolls)
                            .presentationBackgroundInteraction(.enabled)
                        }
                        
                        
                    }
                    .padding(.leading, 1)
                    .padding(.trailing, 2)
                    .padding(.vertical, 2)
                    
                    
                    Text("Find out how we do the calculations.")
                        .font(Font.custom("Inter-Regular", size: 11))
                        .kerning(0.5)
                        .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    
                    Button(action:{
                        isShowingCalculationSheet.toggle()
                    }){
                        Text("Learn more here.")
                            .font(Font.custom("Inter", size: 11))
                            .kerning(0.5)
                            .underline()
                            .foregroundColor(Color(red: 0.16, green: 0.49, blue: 0.36))
                            .bold()
                    }.sheet(isPresented: $isShowingCalculationSheet){
                        VStack{
                            ZStack{
                                HStack {
                                    Spacer()
                                    Text("Info")
                                        .font(
                                            Font.custom("Inter-SemiBold", size: 16)
                                            
                                        )
                                    Spacer() // Spacer to push the Image to the right
                                }
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        isShowingCalculationSheet.toggle()
                                    }){
                                        Text("Done")
                                    }
                                }
                            }.padding(.bottom, 18)
                            VStack(alignment: .leading){
                                Text("As baby grows, breast milk alone starts to fall short of providing sufficient nutritional requirements. This is where introducing weaning foods help bridge the gaps. Quality balanced diet, consisting of a combination of carbohydrates, proteins, and fats, is critical to provide energy for activity, growth, and normal development support of the baby.")
                                    .font(Font.custom("Inter-Regular", size: 12))
                                    .padding(.bottom, 20)
                                Text("By providing a balance macronutrients intake through a diverse nutritious diet, parents can ensure their baby aim for optimal growth and development.")
                                    .font(Font.custom("Inter-Regular", size: 12))
                                    .padding(.bottom, 20)
                                VStack(alignment: .leading){
                                    Text("Carbohydrates")
                                        .font(
                                            Font.custom("Inter-Medium", size: 22)
                                            
                                        )
                                        .padding(.bottom, 10)
                                    Text("35%~60% from Daily Calories for Weaning Food.")
                                        .font(Font.custom("Inter-Regular", size: 12))
                                        .padding(.bottom, 10)
                                    Text("Serve as the main source of energy, providing fuel for daily activities and growth.")
                                        .font(Font.custom("Inter-Regular", size: 12))
                                }.padding(.bottom, 20)
                                
                                VStack(alignment: .leading){
                                    Text("Fat")
                                        .font(
                                            Font.custom("Inter-Medium", size: 22)
                                            
                                        )
                                        .padding(.bottom, 10)
                                    Text("30%~45% from Daily Calories for Weaning Food.")
                                        .font(Font.custom("Inter-Regular", size: 12))
                                        .padding(.bottom, 10)
                                    Text("Play a vital role in brain development, providing insulation and protection for organs, and aiding in fat-soluble vitamins absorption.")
                                        .font(Font.custom("Inter", size: 12))
                                }.padding(.bottom, 20)
                                
                                VStack(alignment: .leading){
                                    Text("Protein")
                                        .font(
                                            Font.custom("Inter-Regular", size: 22)
                                                .weight(.medium)
                                        )
                                        .padding(.bottom, 10)
                                    Text("10%~15% from Daily Calories for Weaning Food.")
                                        .font(Font.custom("Inter-Regular", size: 12))
                                        .padding(.bottom, 10)
                                    Text("Essential for building and repairing body tissues. Also crucial for supporting muscles, bones, and organs development.")
                                        .font(Font.custom("Inter-Regular", size: 12))
                                }.padding(.bottom, 20)
                            }
                            .presentationDetents([.large])
                            .presentationContentInteraction(.scrolls)
                        }
                        .padding(32)
                        Spacer()
                    }
                    .sheet(isPresented: $isShowingEditSheet){
                        EditDataSheet(refreshData: $refreshSummary)
                    }
                    
                }
                .padding(.horizontal, 16)
                .padding(0)
                
               
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
                    
        }
        .onAppear{
            fetchData()

        }
                
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
//        .padding(.top, 5)
        .padding(.bottom, 5)
        .frame(width: .infinity, alignment: .topLeading)
        
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
        .shadow(color: Color(red: 0.18, green: 0.56, blue: 0.42).opacity(0.25), radius: 2, x: 0, y: 0)
        .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 1)
                    .stroke(Color(red: 0.25, green: 0.8, blue: 0.59), lineWidth: 2)

        )
        .onChange(of: refreshSummary) { newValue in
            fetchData()
        }

    }
    
    func fetchData() {
        firestoreManager.getBabiesData(){ fetchBabies in
            self.babies = fetchBabies
        }
    
        firestoreManager.getGiziBabies(){ fetchGizi in
            self.gizi = fetchGizi
        }
    }
    
    func didDismiss(){
            
    }
}
                
//#Preview {
//    SummaryCardView()
//}
