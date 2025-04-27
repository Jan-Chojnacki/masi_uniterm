import SwiftUI

struct UnitermAddValueView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var providedValue: String = ""

    let uniterm: Uniterm
    let onAdd: (NodeItem) -> Void

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
        let value = UnitermValue(uniterm: uniterm, value: providedValue)
        modelContext.insert(value)
        onAdd(NodeItem(value: value.value))
        dismiss()
    }
}