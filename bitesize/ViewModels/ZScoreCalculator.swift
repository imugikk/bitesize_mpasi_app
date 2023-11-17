//
//  ZScoreCalculator.swift
//  bitesize
//
//  Created by Michelle Annice on 29/09/23.
//

import Foundation

enum ZScoreCategoryHeight: String {
    case reallyShort = "Risk Severe Stunting"
    case short = "Risk Stunting"
    case normal = "Normal Height"
    case tall = "Tall"
}

enum ZScoreCategoryWeight: String {
    case reallyUnderweight = "Risk Severe Underweight"
    case underweight = "Risk Underweight"
    case normal = "Normal Weight"
    case overweight = "Risk of Overweight"
}

enum ZScoreCategoryHead: String {
    case microcephaly = "Microcephaly"
    case normal = "Normal"
    case macrocephaly = "Macrocephaly"
}

class ZScoreCalculator {
    
    func calculateZScore(month: Int, weight: Double, height: Double, head: Double) -> [Double]? {

        var lmsDataW = LMSData(weight: weight, height: height, head: head)
        var lmsDataH = LMSData(weight: weight, height: height, head: head)
        var lmsDataHead = LMSData(weight: weight, height: height, head: head)
        var gender = "Female"

        switch gender {
            case "Female":
                lmsDataH.LMS = findLMSGirlL(month: month) ?? []
                lmsDataW.LMS = findLMSGirlW(month: month) ?? []
                lmsDataHead.LMS = findLMSGirlH(month: month) ?? []
            case "Male":
                lmsDataH.LMS = findLMSBoyL(month: month)!
                lmsDataW.LMS = findLMSBoyW(month: month)!
                lmsDataHead.LMS = findLMSBoyH(month: month)!
            default:
                print("no data")
        }

        // Extract L, M, and S values from the LMS data
        let lh = lmsDataH.LMS[0]
        let mh = lmsDataH.LMS[1]
        let sh = lmsDataH.LMS[2]
        
        // Extract L, M, and S values from the LMS data
        let lw = lmsDataW.LMS[0]
        let mw = lmsDataW.LMS[1]
        let sw = lmsDataW.LMS[2]
        
        // Extract L, M, and S values from the LMS data
        let lhead = lmsDataHead.LMS[0]
        let mhead = lmsDataHead.LMS[1]
        let shead = lmsDataHead.LMS[2]

        // Calculate the z-score using the formula
        let zScoreh = ((pow((height / mh), lh) - 1) / (lh * sh))
        let zScorew = ((pow((weight / mw), lw) - 1) / (lw * sw))
        let zScorehead = ((pow((head / mhead), lhead) - 1) / (lhead * shead))

        print(zScoreh)
        print(zScorew)
        print(zScorehead)

        return [zScorew, zScoreh, zScorehead]
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
    
    func statusZscoreWeight(zscore: Double) -> ZScoreCategoryWeight {
        if zscore < -3 {
            return .reallyUnderweight
        } else if zscore >= -3 && zscore < -2 {
            return .underweight
        } else if zscore >= -2 && zscore <= 1 {
            return .normal
        } else {
            return .overweight
        }
    }
    
    func statusZscoreHeight(zscore: Double) -> ZScoreCategoryHeight {
        if zscore < -3 {
            return .reallyShort
        } else if zscore >= -3 && zscore < -2 {
            return .short
        } else if zscore >= -2 && zscore <= 3 {
            return .normal
        } else {
            return .tall
        }
    }
    
    func statusZscoreHead(zscore: Double) -> ZScoreCategoryHead {
        if zscore < -2 {
            return .microcephaly
        } else if zscore >= -2 && zscore <= 2 {
            return .normal
        } else {
            return .macrocephaly
        }
    }
}




