//
//  LMSWeightBoys.swift
//  bitesize
//
//  Created by Michelle Annice on 01/10/23.
//

import Foundation

struct LMSWeightBoys {
    var month: Int
    var l: Double
    var m: Double
    var s: Double
}

// Create instances of LMSWeightBoys and populate the array
let lmsDataWeightBoys: [LMSWeightBoys] = [
    LMSWeightBoys(month: 5, l: 0.1395, m: 7.5105, s: 0.11080),
    LMSWeightBoys(month: 6, l: 0.1257, m: 7.9340, s: 0.10958),
    LMSWeightBoys(month: 7, l: 0.1134, m: 8.2970, s: 0.10902),
    LMSWeightBoys(month: 8, l: 0.1021, m: 8.6151, s: 0.10882),
    LMSWeightBoys(month: 9, l: 0.0917, m: 8.9014, s: 0.10881),
    LMSWeightBoys(month: 10, l: 0.0820, m: 9.1649, s: 0.10891),
    LMSWeightBoys(month: 11, l: 0.0730, m: 9.4122, s: 0.10906),
    LMSWeightBoys(month: 12, l: 0.0644, m: 9.6479, s: 0.10925)
]

// You can add more data rows as needed

// Create a function to find LMS values based on the month
func findLMSBoyW(month: Int) -> [Double]? {
    for lms in lmsDataWeightBoys {
        if lms.month == month {
            return [lms.l, lms.m, lms.s]
        }
    }
    return nil // Month not found
}
