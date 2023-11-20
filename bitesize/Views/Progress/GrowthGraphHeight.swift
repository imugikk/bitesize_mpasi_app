//
//  GrowthGraphHeight.swift
//  bitesize
//
//  Created by febriandianto prabowo on 18/11/23.
//

import SwiftUI

struct GrowthGraphHeight: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State private var babies: [Babies] = []
    var body: some View {
        VStack {
            if babies.first?.gender == "Female" {
                GraphViewHeight(source: "g_age_length.csv")
                .padding(.top, 20)
                .padding(.horizontal, 16)
                .frame(height: 400)
            } else {
                GraphViewHeight(source: "b_age_length.csv")
                .padding(.top, 20)
                .padding(.horizontal, 16)
                .frame(height: 400)
            }
            
            Text("Height against Baby Age (Months) Graph")
                .font(
                    Font.custom("Nunito-SemiBold", size: 24)
                    
                )
                .padding(.horizontal, 16)
                .padding(.top, 20)
            
//            Text("A growth chart is used by pediatricians and other health care providers to follow a child's growth over time. Growth charts have been constructed by observing the growth of large numbers of healthy children over time. The height, weight, and head circumference of a child can be compared to the expected parameters of children of the same age and sex to determine whether the child is growing appropriately. Growth charts can also be used to predict the expected adult height and weight of a child because, in general, children maintain a fairly constant growth curve. When a child deviates from his or her previously established growth curve, investigation into the cause is generally warranted. Parameters used to analyze growth charts include weight velocity (defined as rate of change in weight over time), height velocity (defined as rate of change in stature over time), and whether someone's growth chart crosses percentiles. For instance, endocrine disorders can be associated with a decrease in height velocity and preserved weight velocity while normal growth variants are associated with a decrease in height and weight velocity that are proportional to each other. It's important to note that other parameters are more commonly used such as waist circumference for assessing obesity and skin fold difference for assessing malnutrition. Growth charts can also be compiled with a portion of the population deemed to have been raised in more or less ideal environments, such as nutrition that conforms to pediatric guidelines, and no maternal smoking. Charts from these sources end up with slightly taller but thinner averages")
//                .font(Font.custom("Inter-Regular", size: 16))
//                .padding(.horizontal, 16)
//                .padding(.top, 15)
            
            
            
        }
        .onAppear{
            firestoreManager.getBabiesData(){ fetchBabies in
                self.babies = fetchBabies
            }
        }
        

    }
        
        
    
}

//#Preview {
//    GrowthGraphHeight()
//}
