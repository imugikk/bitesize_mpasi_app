//
//  GraphViewHeight.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 20/11/23.
//

import SwiftUI
import Charts

struct GraphViewHeight: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State private var babies: [Babies] = []
    
    @State var weights: [[Double]] = []
    var monthsLabel: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
    
    
    @State var source: String
    @State var months: [Int]?
        
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    Chart(Array(weights.enumerated()), id: \.offset) { index, column in
                        ForEach(column.indices, id: \.self) { rowIndex in
                            LineMark(
                                x: .value("months", monthsLabel[rowIndex]),
                                y: .value("grade", column[rowIndex]),
                                series: .value("\(index)", "\(index)")
                            )
                        }
                        .foregroundStyle(by: .value("color", column[index]))
                        
                        if (index == 0) {
                            let babyHeights: [Double] = babies.first?.height ?? []
                            let birthday = babies.first?.dob as? Date ?? Date()
                            ForEach(Array(babyHeights.enumerated()), id: \.element) {index, rowIndex in
                                let ageComponents = Calendar.current.dateComponents([.month], from: birthday, to: babies.first!.timeMeasure[index])
                                let ageInMonths = ageComponents.month ?? 0
                                LineMark(
                                    x: .value("months", ageInMonths),
                                    y: .value("grade", rowIndex),
                                    series: .value("Height", "Height")
                                ).foregroundStyle(.red)
                            }
                        }
                    }
                    .chartLegend(.hidden)
                    .aspectRatio(1, contentMode: .fit)
                    .chartYAxis {
                        AxisMarks(values: .automatic(desiredCount: 30))
                    }
                    .chartXAxis {
                        AxisMarks(values: .automatic(desiredCount: 25))
                    }.padding()
                }
            }.onAppear {
                firestoreManager.getBabiesData(){ fetchBabies in
                    self.babies = fetchBabies
                }
                
                weights = readCSV(inputFile: source)
            }
        }
    }

    func readCSV(inputFile: String) -> [[Double]] {
        if let filepath = Bundle.main.path(forResource: inputFile, ofType: nil) {
            do {
                let fileContent = try String(contentsOfFile: filepath)
                var lines = fileContent.components(separatedBy: "\n")
                lines.removeFirst() // Remove the first row
                var results: [[Double]] = []
                for line in lines {
                    let columns = line.components(separatedBy: ";")
                    let filteredColumns = columns.dropFirst()
                    let trimmedColumns = filteredColumns.dropLast().compactMap{
                        Double($0)
                    }
                    results.append(Array(trimmedColumns))
                }
                let transposedResults = transpose(matrix: results)
                
                // Remove specified rows (0, 3, 7, 9)
                let rowsToRemove = [0, 7]
                let filteredResults = transposedResults.enumerated().filter { !rowsToRemove.contains($0.offset) }.map { $0.element }

                return filteredResults
//                return transposedResults

            } catch {
                print("error: \(error)") // to do deal with errors
            }
        } else {
            print("\(inputFile) could not be found")
        }
        return []
    }
    
    func transpose(matrix: [[Double]]) -> [[Double]] {
        guard !matrix.isEmpty else {
            return []
        }

        let rowCount = matrix.count
        let columnCount = matrix[0].count

        var result = Array(repeating: Array(repeating: 0.0, count: rowCount), count: columnCount)

        for i in 0..<rowCount {
            for j in 0..<columnCount {
                result[j][i] = matrix[i][j]
            }
        }

        return result
    }
}

//#Preview {
//    GraphViewHeight()
//}
