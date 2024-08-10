//
//  BrewCrewApp.swift
//  BrewCrew
//
//  Created by Igor Postoev on 1.8.24..
//

import SwiftUI
import SwiftData

@main
struct BrewCrewApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Beverage.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
