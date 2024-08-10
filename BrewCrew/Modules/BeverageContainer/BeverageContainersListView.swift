//
//  BeverageContainersList.swift
//  BrewCrew
//
//  Created by Igor Postoev on 10.8.24..
//

import SwiftUI
import SwiftData

struct BeverageContainersListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var containers: [BeverageContainer]
    @Binding private var path: [Route]
    
    private let beverage: Beverage
    
    init(path: Binding<[Route]>, beverage: Beverage) {
        _path = path
        let beverageId = beverage.id
        _containers = Query(filter: #Predicate<BeverageContainer> { container in
            container.beverage.id == beverageId // passing beverage here would cause a compilation error
        })
        self.beverage = beverage
    }
    
    var body: some View {
        List {
            ForEach(containers) { container in
                Text(getRowString(container))
                .swipeActions {
                    Button {
                        path.append(.beverageContainerEdit(container))
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    .tint(.orange)
                    Button(role: .destructive) {
                        delete(container)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .navigationDestination(for: Beverage.self) { beverage in
            BeverageEditForm(beverage: beverage)
        }
        .navigationTitle("Stocked containers for \(beverage.name)")
    }
    
    private func getRowString(_ container: BeverageContainer) -> String {
        let currentString = (NumberFormatter.decimalFormatter.string(for: container.currentVolume)) ?? "NaN"
        let maxString = (NumberFormatter.decimalFormatter.string(for: container.maxVolume)) ?? "NaN"
        return "\(container.type) \(currentString) / \(maxString) L"
    }
    
    
    private func addItem() {
        withAnimation {
            let container = BeverageContainer(type: "", beverage: beverage, maxVolume: 0, currentVolume: 0)
            modelContext.insert(container)
            path.append(.beverageContainerEdit(container))
        }
    }
    
    private func delete(_ container: BeverageContainer) {
        withAnimation {
            modelContext.delete(container)
        }
    }
}
