//
//  ZScore.swift
//  bitesize
//
//  Created by Michelle Annice on 02/10/23.
//

import Foundation
import FirebaseFirestoreSwift

struct ZScoreResult: Codable {
    @DocumentID var id: String?
    var zScore: [Double]
}
