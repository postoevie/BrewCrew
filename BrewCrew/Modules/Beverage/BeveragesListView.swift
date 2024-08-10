//
//  BeveragesListView.swift
//  BrewCrew
//
//  Created by Igor Postoev on 10.8.24..
//

import SwiftUI
import SwiftData

struct BeveragesListView: View {
    
    @Binding var path: [Route]
    
    @Environment(\.modelContext) private var modelContext
    @Query private var beverages: [Beverage]
    
    var body: some View {
        List {
            ForEach(beverages) { beverage in
                Button {
                    path = [.beverageContainersList(beverage)]
                } label: {
                    Text(beverage.name)
                }
                .swipeActions {
                    Button {
                        path.append(.beverageEdit(beverage))
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    .tint(.orange)
                    Button(role: .destructive) {
                        delete(beverage)
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
        .navigationTitle("Beverages")
    }
    
    private func addItem() {
        withAnimation {
            let beverage = Beverage(name: "")
            modelContext.insert(beverage)
            path.append(.beverageEdit(beverage))
        }
    }
    
    private func delete(_ beverage: Beverage) {
        withAnimation {
            modelContext.delete(beverage)
        }
    }
}

