//
//  LMSHeadBoys.swift
//  bitesize
//
//  Created by Michelle Annice on 07/10/23.
//

import Foundation

struct LMSHeadBoys {
    var month: Int
    var l: Double
    var m: Double
    var s: Double
}

// Create instances of LMSLegthGirls and populate the array
let lmsDataHeadBoys: [LMSHeadBoys] = [
    LMSHeadBoys(month: 5, l: 1.0, m: 42.5576, s: 0.02837),
    LMSHeadBoys(month: 6, l: 1.0, m: 43.3306, s: 0.02817),
    LMSHeadBoys(month: 7, l: 1.0, m: 43.9803, s: 0.02804),
    LMSHeadBoys(month: 8, l: 1.0, m: 44.5300, s: 0.02796),
    LMSHeadBoys(month: 9, l: 1.0, m: 44.9998, s: 0.02792),
    LMSHeadBoys(month: 10, l: 1.0, m: 45.4051, s: 0.02790),
    LMSHeadBoys(month: 11, l: 1.0, m: 45.7573, s: 0.02789),
    LMSHeadBoys(month: 12, l: 1.0, m: 46.0661, s: 0.02789)
]

// Create a function to find LMS values based on the month
func findLMSBoyH(month: Int) -> [Double]? {
    for lms in lmsDataHeadBoys {
        if lms.month == month {
            return [lms.l, lms.m, lms.s]
        }
    }
    return nil // Month not found
}
