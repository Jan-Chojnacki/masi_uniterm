//
//  unitermApp.swift
//  uniterm
//
//  Created by Jan Chojnacki on 02/04/2025.
//

import SwiftUI
import SwiftData

@main
struct unitermApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Uniterm.self,
            UnitermValue.self,
            TreeNode.self,
            NodeItem.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
