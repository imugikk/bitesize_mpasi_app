//
//  LMSWeightBoys.swift
//  bitesize
//
//  Created by Michelle Annice on 01/10/23.
//

import Foundation

struct LMSLengthBoys {
    var month: Int
    var l: Double
    var m: Double
    var s: Double
}

// Create instances of LMSLengthBoys and populate the array
let lmsDataLengthBoys: [LMSLengthBoys] = [
    LMSLengthBoys(month: 5, l: 1.0, m: 65.9026, s: 0.03204),
    LMSLengthBoys(month: 6, l: 1.0, m: 67.6236, s: 0.03165),
    LMSLengthBoys(month: 7, l: 1.0, m: 69.1645, s: 0.03139),
    LMSLengthBoys(month: 8, l: 1.0, m: 70.5994, s: 0.03124),
    LMSLengthBoys(month: 9, l: 1.0, m: 71.9687, s: 0.03117),
    LMSLengthBoys(month: 10, l: 1.0, m: 73.2812, s: 0.03118),
    LMSLengthBoys(month: 11, l: 1.0, m: 74.5388, s: 0.03125),
    LMSLengthBoys(month: 12, l: 1.0, m: 75.7488, s: 0.03137)
]

// You can add more data rows as needed

// Create a function to find LMS values based on the month
func findLMSBoyL(month: Int) -> [Double]? {
    for lms in lmsDataLengthBoys {
        if lms.month == month {
            return [lms.l, lms.m, lms.s]
        }
    }
    return nil // Month not found
}
