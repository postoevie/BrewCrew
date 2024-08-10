//
//  BeverageContainerEditView.swift
//  BrewCrew
//
//  Created by Igor Postoev on 10.8.24..
//

import SwiftData
import SwiftUI

struct BeverageContainerEditView: View {
    
    @Bindable var container: BeverageContainer

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $container.type)
                TextField("Current volume", value: $container.currentVolume, formatter: NumberFormatter.decimalFormatter)
                TextField("Full volume", value: $container.maxVolume, formatter: NumberFormatter.decimalFormatter)
            }
        }
        .navigationTitle("Edit beverage")
        .navigationBarTitleDisplayMode(.inline)
    }
}
