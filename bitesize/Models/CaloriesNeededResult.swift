//
//  CaloriesNeededResult.swift
//  bitesize
//
//  Created by Michelle Annice on 06/10/23.
//

import Foundation
import FirebaseFirestoreSwift

struct CaloriesNeededResult: Codable {
    @DocumentID var id: String?
    var caloriesNeeded: Double
}
