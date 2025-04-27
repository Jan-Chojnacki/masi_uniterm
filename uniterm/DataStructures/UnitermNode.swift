//
//  UnitermNode.swift
//  uniterm
//
//  Created by Jan Chojnacki on 02/04/2025.
//

import Foundation
import SwiftData

@Model
class Uniterm {
    var root: TreeNode

    var name: String

    @Relationship(inverse: \UnitermValue.uniterm)
    var values: [UnitermValue] = []

    init(name: String) {
        self.root = TreeNode(item: NodeItem(operation: .error))

        self.name = name
    }
}

@Model
class UnitermValue {
    @Relationship
    var uniterm: Uniterm

    var value: String

    init(uniterm: Uniterm, value: String) {
        self.uniterm = uniterm
        self.value = value
    }
}

@Model
class TreeNode {
    var item: NodeItem
    var parent: TreeNode?
    var left: TreeNode?
    var right: TreeNode?

    init(
        item: NodeItem,
        parent: TreeNode? = nil,
        left: TreeNode? = nil,
        right: TreeNode? = nil
    ) {
        self.item = item
        self.parent = parent
        self.left = left
        self.right = right
    }

    func isLeaf() -> Bool {
        return left == nil && right == nil
    }

    func isRoot() -> Bool {
        return parent == nil
    }

    func delete(_ modelContext: ModelContext) {
        if let left = left {
            left.delete(modelContext)
        }

        if let right = right {
            right.delete(modelContext)
        }

        if !isRoot() {
            parent?.deleteChild(self)
            modelContext.delete(self)
        }
    }

    func deleteChild(_ child: TreeNode) {
        if left == child {
            left = nil
        }

        if right == child {
            right = nil
        }
    }
}

enum OperationType: String, Codable {
    case sequencing = "sequencing"
    case parallelization = "parallelization"
    case error = "error"
}

@Model
class NodeItem {
    var operation: OperationType? = nil
    var value: String? = nil

    init(operation: OperationType) {
        self.operation = operation
    }

    init(value: String) {
        self.value = value
    }
}
