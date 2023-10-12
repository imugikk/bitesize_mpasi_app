//
//  UserManager.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 16/10/23.
//

import Foundation

struct UserManager {
    let baby: Babies
    
    var babyId: String {
        baby.id ?? ""
    }
    
    var name: String {
        baby.name
    }
    
    var zscore: [Double] {
        baby.zscore
    }
}
