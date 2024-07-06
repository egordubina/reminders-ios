//
//  TodosApp.swift
//  Todos
//
//  Created by Егор Дубина on 03.07.2024.
//

import SwiftUI
import SwiftData

@main
struct TodosApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Reminder.self,
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
