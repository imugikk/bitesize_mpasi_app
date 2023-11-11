//
//  BabyUser.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 11/11/23.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let babyName: String
    let babyAge: Double
    let gender: String
    let profileImageURL: String?
}

extension User {
    static let MOCK_USER = User(babyName: "Jiajia", babyAge: 7, gender: "Female", profileImageURL: "ProfileBrianna" )
}
