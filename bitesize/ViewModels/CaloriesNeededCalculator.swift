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
        
        if ageInMonths >= 4 && ageInMonths <= 6 {
            caloriesNeeded = (89 * weight - 100) + 56
        } else if ageInMonths >= 7 && ageInMonths <= 12 {
            caloriesNeeded = (89 * weight - 100) + 22
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
