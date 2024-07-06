//
//  ContentView.swift
//  Todos
//
//  Created by Егор Дубина on 03.07.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var reminders: [Reminder]
    @State private var showAddReminderSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(reminders) { reminder in
                    NavigationLink {
                        EditReminder(reminder: reminder)
                    } label: {
                        TodoView(todo: reminder)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: { showAddReminderSheet.toggle() }) {
                        Label("Add a new reminder", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("All reminders")
        }
        .sheet(isPresented: $showAddReminderSheet) {
            NavigationStack {
                EditReminder(reminder: .emptyReminder)
                    .navigationTitle("Create a new reminder")
            }
        }
    }
    
    private func createItem(newReminder: Reminder) {
        withAnimation {
            modelContext.insert(newReminder)
        }
        showAddReminderSheet.toggle()
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(reminders[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Reminder.self, inMemory: true)
}
