//
//  BeverageCategory.swift
//  BrewCrew
//
//  Created by Igor Postoev on 9.8.24..
//

import SwiftData

@Model
class BeverageCategory {
    
    let name: String
    let beverages: [Beverage]
    
    init(name: String, beverages: [Beverage]) {
        self.name = name
        self.beverages = beverages
    }
}

