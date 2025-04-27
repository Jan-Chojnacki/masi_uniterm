//
//  ContentView.swift
//  uniterm
//
//  Created by Jan Chojnacki on 02/04/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Uniterm]

    @State private var isSheetShown = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        UnitermView(node: item.root, uniterm: item)
                    } label: {
                        Text(item.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            #if os(macOS)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            #endif
            .toolbar {
                #if os(iOS)
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                #endif
                ToolbarItem {
                    Button {
                        isSheetShown.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                    .sheet(isPresented: $isSheetShown) {
                        AddUnitermView { name in
                            addItem(name: name)
                        }
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem(name: String) {
        withAnimation {
            let newItem = Uniterm(name: name)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(
            for: [
                Uniterm.self,
                TreeNode.self,
                NodeItem.self,
            ], inMemory: true)
}
