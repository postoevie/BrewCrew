//
//  NumberFormatter+Brew.swift
//  BrewCrew
//
//  Created by Igor Postoev on 10.8.24..
//

import Foundation

extension NumberFormatter {
    
    static let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
