//
//  LMSData.swift
//  bitesize
//
//  Created by Michelle Annice on 02/10/23.
//

import Foundation


struct LMSData {
    var weight: Double
    var height: Double
    var LMS: [Double] = []
    
    init(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
    }
}
