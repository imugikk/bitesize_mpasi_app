//
//  CaloriesNeededCalculator.swift
//  bitesize
//
//  Created by Michelle Annice on 06/10/23.
//

import Foundation

class CaloriesNeededCalculator {
    func calculateCaloriesNeeded(dob: Date, weight: Double) -> Double? {
        // Calculate the age in months
        let ageInMonths = calculateMonthsSinceBirth(dob: dob)
        
        // Calculate calories based on age
        var caloriesNeeded: Double?
        
        if ageInMonths >= 4 && ageInMonths < 6 {
            caloriesNeeded = 0
        }
        else if ageInMonths >= 6 && ageInMonths < 7 {
            caloriesNeeded = 0.3 * ((89 * weight - 100) + 56)
        }
        else if ageInMonths >= 7 && ageInMonths <= 8 {
            caloriesNeeded = 0.3 * ((89 * weight - 100) + 22)
        }
        else if ageInMonths >= 9 && ageInMonths <= 11 {
            caloriesNeeded = 0.5 * ((89 * weight - 100) + 22)
        }
        else if ageInMonths >= 12 && ageInMonths <= 12 {
            caloriesNeeded = 0.7 * ((89 * weight - 100) + 22)
        }
        else if ageInMonths >= 13 && ageInMonths <= 24 {
            caloriesNeeded = 0.7 * ((89 * weight - 100) + 20)
        }
        else if ageInMonths >= 24 && ageInMonths <= 35 {
            caloriesNeeded = (89 * weight - 100) + 20
        }
        
        return caloriesNeeded
    }
    
    private func calculateMonthsSinceBirth(dob: Date) -> Int {
        let currentDate = Date()
        let calendar = Calendar.current

        let ageComponents = calendar.dateComponents([.month], from: dob, to: currentDate)
        if let months = ageComponents.month {
            return months
        } else {
            return 0 // Unable to calculate months
        }
    }
}
