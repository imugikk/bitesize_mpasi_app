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
    var head: Double
    var LMS: [Double] = []
    
    init(weight: Double, height: Double, head: Double) {
        self.weight = weight
        self.height = height
        self.head = head
    }
}
