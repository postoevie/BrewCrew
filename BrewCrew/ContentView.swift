//
//  ContentView.swift
//  BrewCrew
//
//  Created by Igor Postoev on 1.8.24..
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var beverages: [Beverage]
    
    @State private var path: [Beverage] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(beverages) { beverage in
                    NavigationLink(value: beverage) {
                        Text(beverage.name)
                    }
                    .swipeActions {
                        Button {
                            path = [beverage]
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
            .navigationDestination(for: Beverage.self) { beverage in
                BeverageEditForm(beverage: beverage)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let beverage = Beverage(name: "")
            modelContext.insert(beverage)
            path = [beverage]
        }
    }
    
    private func delete(_ beverage: Beverage) {
        withAnimation {
            modelContext.delete(beverage)
        }
    }
}

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

#Preview {
    ContentView()
        .modelContainer(for: Beverage.self, inMemory: true)
}
