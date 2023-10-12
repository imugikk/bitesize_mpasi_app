//
//  GraphView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 03/10/23.
//

import SwiftUI
import Charts

struct GraphView: View {
    @State var weights: (xvalue: [String], yvalue: [[Double]]) = ([],[])
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Read CSV")
                
//                Chart(0..<weights.yvalue.count, id:\.self) { data in
//                    LineMark(
//                        x: .value("Month", weights.xvalue[data]),
//                        y: .value("Calories", weights.yvalue[data])
//                    )
//                }.padding()
                
//                List(Array(weights.keys), id: \.self) { weight in
//                    VStack {
//                        Text(weight)
//                        Text(weights[weight] ?? "no data")
//                    }
//                }
            }.onAppear {
                weights = readCSV(inputFile: "b_age_headc.csv")
            }
        }
    }
    
    func readCSV(inputFile: String) -> (xvalue: [String], yvalue: [[Double]]) {
        if let filepath = Bundle.main.path(forResource: inputFile, ofType: nil) {
            do {
                let fileContent = try String(contentsOfFile: filepath)
                let lines = fileContent.components(separatedBy: "\n")
                var xvalue: [String] = []
                var yvalue: [[Double]] = []
                
                if lines.count > 0 {
                    let row0 = lines[0].components(separatedBy: ";")
                    xvalue = [row0[1], row0[4], row0[6], row0[8], row0[11]]
                }
                print (xvalue)
                
                for i in 1..<lines.count {
                    let row = lines[i].components(separatedBy: ";")
                    yvalue.append([Double(row[1]) ?? 0.0, Double(row[4]) ?? 0.0, Double(row[6]) ?? 0.0, Double(row[8]) ?? 0.0, Double(row[11]) ?? 0.0])
                }
                print (yvalue)
                return (xvalue, yvalue)
            } catch {
                print("error: \(error)") // to do deal with errors
            }
        } else {
            print("\(inputFile) could not be found")
        }
        return ([],[])
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
