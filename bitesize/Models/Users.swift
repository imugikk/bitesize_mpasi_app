//
//  Users.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 26/09/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Users: Codable {
    @DocumentID var id: String?
    var username: String
    var password: String
    var email: String
}
