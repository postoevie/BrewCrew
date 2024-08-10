//
//  BeverageEditForm.swift
//  BrewCrew
//
//  Created by Igor Postoev on 10.8.24..
//

import SwiftUI
import SwiftData

struct BeverageEditForm: View {
    
    @Bindable var beverage: Beverage
    
    var body: some View {
        Form {
            TextField("Name", text: $beverage.name)
            
        }
        .navigationTitle("Edit beverage")
        .navigationBarTitleDisplayMode(.inline)
    }
}
