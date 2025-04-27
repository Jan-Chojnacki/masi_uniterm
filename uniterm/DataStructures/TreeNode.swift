//
//  TreeNode.swift
//  uniterm
//
//  Created by Jan Chojnacki on 28/04/2025.
//


import Foundation
import SwiftData

@Model
class TreeNode {
    var item: NodeItem
    
    @Relationship(deleteRule: .nullify)
    var parent: TreeNode?
    
    @Relationship(deleteRule: .cascade)
    var left: TreeNode?
    
    @Relationship(deleteRule: .cascade)
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