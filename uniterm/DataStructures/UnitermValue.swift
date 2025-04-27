//
//  UnitermValue.swift
//  uniterm
//
//  Created by Jan Chojnacki on 28/04/2025.
//


import Foundation
import SwiftData

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