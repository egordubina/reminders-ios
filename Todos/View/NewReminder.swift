//
//  NewReminder.swift
//  Todos
//
//  Created by Егор Дубина on 08.07.2024.
//

import SwiftUI

struct NewReminder: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var reminder: Reminder = .emptyReminder
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Name", text: $reminder.reminder)
                    TextField("Description", text: $reminder.notes, axis: .vertical).lineLimit(5...10)
                    Toggle(isOn: $reminder.flag) {
                        HStack {
                            Image(systemName: reminder.flag ? "flag.fill" : "flag").foregroundColor(.orange).bold()
                            Text("Flag")
                        }
                    }
                    Picker("Priority", selection: $reminder.priority) {
                        ForEach(Reminder.ReminderPriority.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
//                    DatePicker(
//                        "Notification",
//                        selection: $reminder.notification,
//                        displayedComponents: [.date, .hourAndMinute]
//                    )
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        modelContext.insert(reminder)
                        dismiss()
                    }) {
                        Text("Save")
                    }.disabled(reminder.reminder.isEmpty)
                }
            }
            .navigationTitle("Create a new reminder")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NewReminder()
}
