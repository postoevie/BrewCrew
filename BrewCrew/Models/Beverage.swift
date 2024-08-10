//
//  Beverage.swift
//  BrewCrew
//
//  Created by Igor Postoev on 8.8.24..
//

import SwiftData
import Foundation

@Model
class Beverage {
    
    var id: UUID = UUID()
    var name: String
    
    @Relationship(deleteRule: .cascade) var containers: [BeverageContainer] = []
    
    init(name: String) {
        self.name = name
    }
}
