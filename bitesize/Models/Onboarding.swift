//
//  Onboarding.swift
//  bitesize
//
//  Created by febriandianto prabowo on 13/11/23.
//

import Foundation

struct Page: Identifiable, Equatable {
    
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample", imageUrl: "Onboarding1", tag: 0)
    
    static var samplePages : [Page] = [
        Page(name: "Calculate Nutrition", description: "Calculate the right nutritions needed for your baby just from your fingertip.", imageUrl: "Onboarding1", tag: 0),
        Page(name: "Personalized Menu", description: "Personalized menu is made for you to fulfill your baby’s nutritions per day. ", imageUrl: "Onboarding2", tag: 1),
        Page(name: "Track Baby Progress", description: "Track your baby progress every month to keep your baby healthy. ", imageUrl: "Onboarding3", tag: 2)
    
    ]
    
}

