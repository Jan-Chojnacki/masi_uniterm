//
//  NodeItem.swift
//  uniterm
//
//  Created by Jan Chojnacki on 28/04/2025.
//


import Foundation
import SwiftData

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