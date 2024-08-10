//
//  ContentView.swift
//  BrewCrew
//
//  Created by Igor Postoev on 1.8.24..
//

import SwiftUI
import SwiftData

enum Route: Equatable, Hashable  {
    case beverageEdit(Beverage)
    case beverageContainersList(Beverage)
    case beverageContainerEdit(BeverageContainer)
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.stringKey == rhs.stringKey
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.stringKey)
    }
    
    var stringKey: String {
        switch self {
        case .beverageContainersList:
            "beverageContainer"
        case .beverageEdit:
            "beverageEdit"
        case .beverageContainerEdit:
            "beverageContainerEdit"
        }
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var navigationPath: [Route] = []
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            BeveragesListView(path: $navigationPath)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .beverageEdit(let beverage):
                        BeverageEditForm(beverage: beverage)
                    case .beverageContainersList(let beverage):
                        BeverageContainersListView(path: $navigationPath, beverage: beverage)
                    case .beverageContainerEdit(let container):
                        BeverageContainerEditView(container: container)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Beverage.self, inMemory: true)
}
