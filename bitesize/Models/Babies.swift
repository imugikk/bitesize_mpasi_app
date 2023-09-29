//
//  Babies.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/09/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Babies: Codable {    
    @DocumentID var id: String?
    var name: String
    var gender: String
    var dob: Date
    var weight: Double
    var height: Double
    var hc: Double
    var userId: String
}
