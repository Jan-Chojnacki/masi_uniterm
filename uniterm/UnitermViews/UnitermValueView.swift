//
//  UnitermValueView.swift
//  uniterm
//
//  Created by Jan Chojnacki on 27/04/2025.
//

import SwiftUI

struct UnitermValueView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isSheetPresented = false
    var text: String

    let uniterm: Uniterm
    let onChange: (String) -> Void

    var body: some View {
        Menu {
            ForEach(uniterm.values) { value in
                Button(value.value.capitalized) {
                    onChange(value.value.capitalized)
                }
            }
            Button("Add", systemImage: "plus") {
                isSheetPresented = true
            }
            .labelStyle(.titleAndIcon)
            Button("Delete", systemImage: "delete.right") {
                withAnimation(.default) {
                    onChange("")
                }
            }
            .labelStyle(.titleAndIcon)
        } label: {
            Text(text.capitalized)
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $isSheetPresented) {
            UnitermAddValueView(uniterm: uniterm) { newItem in
                let value = UnitermValue(uniterm: uniterm, value: newItem)
                modelContext.insert(value)
                onChange(newItem)
            }
        }
        .presentationDetents([.medium])
    }
}
