//
//  Uniterm.swift
//  uniterm
//
//  Created by Jan Chojnacki on 28/04/2025.
//


import Foundation
import SwiftData

@Model
class Uniterm {
    @Relationship(deleteRule: .cascade)
    var root: TreeNode

    var name: String

    @Relationship(deleteRule: .cascade, inverse: \UnitermValue.uniterm)
    var values: [UnitermValue] = []

    init(name: String) {
        self.root = TreeNode(item: NodeItem(operation: .error))

        self.name = name
    }
}