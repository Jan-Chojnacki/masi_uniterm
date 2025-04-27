import SwiftUI

struct UnitermAddButton: View {
    @State private var isSheetPresented = false

    let uniterm: Uniterm
    let onAdd: (NodeItem) -> Void

    var body: some View {
        Menu {
            Menu("Operations") {
                Button(OperationType.sequencing.rawValue.capitalized) {
                    onAdd(NodeItem(operation: .sequencing))
                }
                Button(OperationType.parallelization.rawValue.capitalized) {
                    onAdd(NodeItem(operation: .parallelization))
                }
            }
            Menu("Values") {
                ForEach(uniterm.values) { value in
                    Button(value.value.capitalized) {
                        onAdd(NodeItem(value: value.value))
                    }
                }
                Button("Add", systemImage: "plus") {
                    isSheetPresented = true
                }
                .labelStyle(.titleAndIcon)
            }
        } label: {
            Image(systemName: "plus.square.fill")
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $isSheetPresented) {
            UnitermAddValueView(uniterm: uniterm) { newItem in
                onAdd(newItem)
            }
        }
        .presentationDetents([.medium])
    }
}