//
//  GraphView.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 03/10/23.
//

import SwiftUI

struct GraphView: View {
    
    @State var weights: [String:String] = [:]
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Read CSV")
                List(Array(weights.keys), id: \.self) { weight in
                    VStack {
                        Text(weight)
                        Text(weights[weight] ?? "no data")
                    }
                }
            }.onAppear {
                weights = readCSV(inputFile: "b_age_weight.csv")
            }
        }
    }
    
    func readCSV(inputFile: String) -> [String:String] {
        if let filepath = Bundle.main.path(forResource: inputFile, ofType: nil) {
            do {
                let fileContent = try String(contentsOfFile: filepath)
                let lines = fileContent.components(separatedBy: "\n")
                var results: [String:String] = [:]
                lines.dropFirst().forEach { line in
                    let data = line.components(separatedBy: ",")
                    
                }
                return results
            } catch {
                print("error: \(error)") // to do deal with errors
            }
        } else {
            print("\(inputFile) could not be found")
        }
        return [:]
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
