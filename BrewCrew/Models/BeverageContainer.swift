//
//  BeverageContainer.swift
//  BrewCrew
//
//  Created by Igor Postoev on 9.8.24..
//

import SwiftData

@Model
class BeverageContainer {
    
    let name: String
    let beverage: Beverage
    let maxVolume: Double
    let remainPart: Double
    
    init(name: String,
         beverage: Beverage,
         maxVolume: Double,
         remainPart: Double
    ) {
        self.name = name
        self.beverage = beverage
        self.maxVolume = maxVolume
        self.remainPart = remainPart
    }
}
