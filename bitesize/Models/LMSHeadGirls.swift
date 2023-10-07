//
//  LMSHeadGirls.swift
//  bitesize
//
//  Created by Michelle Annice on 07/10/23.
//

import Foundation

struct LMSHeadGirls {
    var month: Int
    var l: Double
    var m: Double
    var s: Double
}

// Create instances of LMSLegthGirls and populate the array
let lmsDataHeadGirls: [LMSHeadGirls] = [
    LMSHeadGirls(month: 5, l: 1.0, m: 41.4590, s: 0.03102),
    LMSHeadGirls(month: 6, l: 1.0, m: 42.1995, s: 0.03087),
    LMSHeadGirls(month: 7, l: 1.0, m: 42.8290, s: 0.03075),
    LMSHeadGirls(month: 8, l: 1.0, m: 43.3671, s: 0.03063),
    LMSHeadGirls(month: 9, l: 1.0, m: 43.8300, s: 0.03053),
    LMSHeadGirls(month: 10, l: 1.0, m: 44.2319, s: 0.03044),
    LMSHeadGirls(month: 11, l: 1.0, m: 44.5844, s: 0.03035),
    LMSHeadGirls(month: 12, l: 1.0, m: 44.8965, s: 0.03027)
]

// Create a function to find LMS values based on the month
func findLMSGirlH(month: Int) -> [Double]? {
    for lms in lmsDataHeadGirls {
        if lms.month == month {
            return [lms.l, lms.m, lms.s]
        }
    }
    return nil // Month not found
}

