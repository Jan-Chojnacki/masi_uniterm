//
//  UnitermAddValueView.swift
//  uniterm
//
//  Created by Jan Chojnacki on 27/04/2025.
//


import SwiftUI

struct UnitermAddValueView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var providedValue: String = ""

    let uniterm: Uniterm
    let onAdd: (String) -> Void

    var body: some View {
        VStack {
            Text("Test")
            TextField("Nazwa", text: $providedValue)
                .frame(width: 200)
                .padding(.bottom, 7)
            HStack {
                Button("Cancel") {
                    cancel()
                }
                Button("Add") {
                    add()
                }
            }
        }
        .padding()
    }

    func cancel() {
        dismiss()
    }

    func add() {
        if providedValue.isEmpty {
            return
        }
        onAdd(providedValue)
        dismiss()
    }
}
