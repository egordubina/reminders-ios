//
//  ContentView.swift
//  Todos
//
//  Created by Егор Дубина on 03.07.2024.
//

import SwiftUI
import SwiftData

struct RemindersView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var reminders: [Reminder]
    
    @State private var isPresentingNewReminderView: Bool = false
    @State private var reminderToEdit: Reminder?
    
    var body: some View {
        NavigationStack {
            List(reminders) { reminder in
                ReminderRowItem(reminder: reminder)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            withAnimation {
                                modelContext.delete(reminder)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            reminder.flag.toggle()
                        } label: {
                            Label("Flag", systemImage: reminder.flag ? "flag.slash.fill" : "flag.fill")
                        }
                        .tint(.orange)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture { reminderToEdit = reminder }
            }
            .listStyle(.plain)
            .navigationTitle("All reminders")
            .toolbar {
                if !reminders.isEmpty {
                    ToolbarItem {
                        Button(action: { isPresentingNewReminderView = true }) {
                            Label("Add a new reminder", systemImage: "plus")
                        }
                    }
                }
            }
            .overlay {
                if reminders.isEmpty {
                    ContentUnavailableView(
                        label: {
                            Label("No Reminders", systemImage: "list.bullet.rectangle.portrait")
                        },
                        description: {
                            Text("Create your first reminder")
                        },
                        actions: {
                            Button("Create reminder") {
                                isPresentingNewReminderView = true
                            }
                        }
                    ).offset(y: -60)
                }
            }
        }
        .sheet(isPresented: $isPresentingNewReminderView) { NewReminder() }
        .sheet(item: $reminderToEdit) { reminder in
            EditReminder(reminder: reminder)
        }
    }
}

#Preview {
    RemindersView()
        .modelContainer(for: Reminder.self, inMemory: true)
}
