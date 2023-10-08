//
//  Bahan.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 08/10/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Bahan: Codable {
    var id: String
    var Berat: Double
    var Kalori: Double
    var KaloriG: Double
    var Protein: Double
    var ProteinG: Double
    var Karbo: Double
    var KarboG: Double
    var Lemak: Double
    var LemakG: Double
    var Sumber: [String]
}
