//
//  ZScoreCalculator.swift
//  bitesize
//
//  Created by Michelle Annice on 29/09/23.
//

import Foundation

class ZScoreCalculator {
    func calculateZScore(month: Int, weight: Double) -> Double? {
        // Find the LMS data for the given month
        guard let lmsData = findLMSData(month: month) else {
            return nil // Data not found for the given month
        }
        
        // Extract L, M, and S values from the LMS data
        let l = lmsData.l
        let m = lmsData.m
        let s = lmsData.s
        
        // Calculate the z-score using the formula
        let zScore = ((pow((weight / m), l) - 1) / (l * s))
        
        return zScore
    }
    
    // Helper function to find LMS data for a given month
    private func findLMSData(month: Int) -> LMSWeightGirls? {
        // Replace this with your actual LMS data retrieval logic
        // You'll need to search your LMS data array for the corresponding month
        // and return the LMS data for that month.
        
        // For demonstration purposes, I'll return a sample LMS data for month 6.
        let sampleData = LMSWeightGirls(month: 6, l: 1.0, m: 65.7311, s: 0.03448)
        return sampleData
    }
}
