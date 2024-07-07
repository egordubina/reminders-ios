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
    @State private var newReminder: Reminder = .emptyReminder
    @State private var showEditReminderSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List(reminders) { reminder in
                NavigationLink {
                    EditReminder(reminder: reminder)
                        .navigationTitle("Detail info")
                } label: {
                    ReminderRowItem(reminder: reminder)
                }
            }
            .listStyle(.plain)
            .toolbar {
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
                EditReminder(reminder: newReminder)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: { showAddReminderSheet.toggle() }) {
                                Text("Cancel")
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button(action: { createReminder(reminder: newReminder) }) {
                                Text("Save")
                            }.disabled(newReminder.reminder.isEmpty)
                        }
                    }
                    .navigationTitle("Create a new reminder")
            }
        }
    }
    
    private func createReminder(reminder: Reminder) {
        withAnimation {
            modelContext.insert(reminder)
        }
        showAddReminderSheet.toggle()
    }
    
    private func deleteReminder(offsets: IndexSet) {
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
