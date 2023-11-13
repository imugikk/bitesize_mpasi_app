//
//  LoadingBarView.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import SwiftUI

struct LoadingBarView: View {
    
    @State var containerWidth: CGFloat = 0
    @State var progressTitle: String = ""
    @State var progress: Int = 0
    @Binding var isActive: Bool
    
    var maxWidth: Double {
        return min(Double(progress), containerWidth)
    }
    
     var goal = 4
    @State var step = 1
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading){
                GeometryReader {
                    geo in
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.clear)
                        .onAppear {
                            containerWidth = geo.size.width
                        }
                }
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.96))
                
                ZStack(alignment: .trailing){
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(red: 0.25, green: 0.8, blue: 0.59))
                    
    //                Text("1/4")
    //                    .foregroundColor(.white)
    //                    .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                    
                }
                
                .frame(width: maxWidth, height: 5)
                
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(16)
            .onAppear{
                progress = 0
                 
                 Task{
                     for i in 1...100 {
                         try await Task.sleep(until: .now.advanced(by: .milliseconds(50)), clock: ContinuousClock())
                         
                         progressTitle = "\(i)%"
                         progress = Int(Double(containerWidth) / 100 * Double(i))
                         
                     }
                 }
            }
            .onChange(of: progress) { newValue in
                print (newValue)
                if newValue >= 398 {
                    isActive = true
                }
            }
            
//            Button("Start") {
//               progress = 0
//                
//                Task{
//                    for i in 1...100 {
//                        try await Task.sleep(until: .now.advanced(by: .milliseconds(50)), clock: ContinuousClock())
//                        
//                        progressTitle = "\(i)%"
//                        progress = Int(Double(containerWidth) / 100 * Double(i))
//                        
//                    }
//                }
//                
//            }
        }
        
    }
}

//#Preview {
//    LoadingBarView()
//}
