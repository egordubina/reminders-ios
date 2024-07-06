//
//  EditReminder.swift
//  Todos
//
//  Created by Егор Дубина on 05.07.2024.
//

import SwiftUI

struct EditReminder: View {
    @Bindable var reminder: Reminder
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $reminder.reminderName)
                TextField("Description", text: $reminder.reminderDescription, axis: .vertical).lineLimit(5...10)
                Toggle(isOn: $reminder.isCompleted) {
                    Text("Flag")
                }
                Picker("Priority", selection: $reminder.priority) {
                    ForEach(Reminder.ReminderPriority.allCases, id: \.self) {
                        Text($0.rawValue).tag($0)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {  }) {
                    Text("Cancel")
                }
            }
            ToolbarItem(placement: .primaryAction) {
                Button(action: {  }) {
                    Text("Save")
                }.disabled(reminder.reminderName.isEmpty)
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditReminder(reminder: .emptyReminder)
    }
}
