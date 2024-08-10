//
//  BeverageContainer.swift
//  BrewCrew
//
//  Created by Igor Postoev on 9.8.24..
//

import SwiftData

@Model
class BeverageContainer {
    
    var type: String
    var beverage: Beverage
    var maxVolume: Double
    var currentVolume: Double
    
    init(type: String,
         beverage: Beverage,
         maxVolume: Double,
         currentVolume: Double
    ) {
        self.type = type
        self.beverage = beverage
        self.maxVolume = maxVolume
        self.currentVolume = currentVolume
    }
}
