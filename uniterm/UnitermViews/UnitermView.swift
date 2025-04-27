import SwiftUI

struct UnitermView: View {
    @Environment(\.modelContext) private var modelContext
    
    var node: TreeNode
    let uniterm: Uniterm

    @State private var contentWidth: CGFloat = 0

    init(node: TreeNode, uniterm: Uniterm) {
        self.node = node
        self.uniterm = uniterm
    }

    var body: some View {
        VStack(spacing: 0) {
            Menu {
                Button(OperationType.sequencing.rawValue.capitalized) {
                    withAnimation(.default) {
                        node.item.operation = .sequencing
                    }
                }
                Button(OperationType.parallelization.rawValue.capitalized) {
                    withAnimation(.default) {
                        node.item.operation = .parallelization
                    }
                }
                Button("Delete", systemImage: "delete.right") {
                    withAnimation(.default) {
                        node.delete(modelContext)
                    }
                }
                .labelStyle(.titleAndIcon)
            } label: {
                Group {
                    switch node.item.operation {
                    case .sequencing:
                        SequencingLine()
                            .transition(.scale.combined(with: .opacity))
                    case .parallelization:
                        ParallelizationLine()
                            .transition(.scale.combined(with: .opacity))
                    case .error:
                        ErrorLine()
                            .transition(.scale.combined(with: .opacity))
                    case .none:
                        ErrorLine()
                            .transition(.scale.combined(with: .opacity))
                    }
                }
                .frame(height: 12)
            }
            .buttonStyle(.plain)

            HStack(spacing: 0) {
                Group {
                    if let left = node.left {
                        if let value = left.item.value {
                            UnitermValueView(text: value, uniterm: uniterm) { newItem in
                                if newItem.isEmpty {
                                    left.delete(modelContext)
                                } else {
                                    left.item.value = newItem
                                }
                            }
                        } else {
                            UnitermView(node: left, uniterm: uniterm)
                        }
                    } else {
                        UnitermAddButton(uniterm: uniterm) { newItem in
                            node.left = TreeNode(item: newItem, parent: node)
                        }
                    }
                }
                .padding(.trailing, 7)

                Text(";")

                Group {
                    if let right = node.right {
                        if let value = right.item.value {
                            UnitermValueView(text: value, uniterm: uniterm) { newItem in
                                if newItem.isEmpty {
                                    right.delete(modelContext)
                                } else {
                                    right.item.value = newItem
                                }
                            }
                        } else {
                            UnitermView(node: right, uniterm: uniterm)
                        }
                    } else {
                        UnitermAddButton(uniterm: uniterm) { newItem in
                            node.right = TreeNode(item: newItem, parent: node)
                        }
                    }
                }
                .padding(.leading, 7)
            }
            .onGeometryChange(for: CGFloat.self) { proxy in
                proxy.size.width
            } action: { newValue in
                contentWidth = newValue
            }
        }
        .frame(width: contentWidth + 8)
    }
}

#Preview {
    let uniterm = Uniterm(name: "test")

    let treeNodeA: TreeNode = TreeNode(item: NodeItem(value: "a"))
    let treeNodeB: TreeNode = TreeNode(item: NodeItem(value: "b"))
    let treeNodeOperation: TreeNode = TreeNode(
        item: NodeItem(operation: .sequencing),
        left: treeNodeA,
        right: nil)

    let treeNodeC: TreeNode = TreeNode(item: NodeItem(value: "c"))
    let treeNodeOperation2: TreeNode = TreeNode(
        item: NodeItem(operation: .parallelization),
        left: treeNodeC,
        right: treeNodeOperation)

    UnitermView(node: treeNodeOperation2, uniterm: uniterm)
        .padding()
}
