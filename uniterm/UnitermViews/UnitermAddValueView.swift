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
            Text("Add Value Name")
                .font(.headline)
            TextField("Name", text: $providedValue)
                .padding(.bottom, 7)
                .textFieldStyle(.roundedBorder)
            HStack {
                Button("Cancel") {
                    cancel()
                }
                Spacer()
                Button("Add") {
                    add()
                }
            }
            Spacer()
        }
        .padding()
        .presentationDetents([.medium])
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
