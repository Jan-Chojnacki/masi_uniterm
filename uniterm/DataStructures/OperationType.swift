//
//  OperationType.swift
//  uniterm
//
//  Created by Jan Chojnacki on 28/04/2025.
//


import Foundation
import SwiftData

enum OperationType: String, Codable {
    case sequencing = "sequencing"
    case parallelization = "parallelization"
    case error = "error"
}