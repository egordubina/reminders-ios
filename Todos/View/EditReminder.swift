//
//  EditReminder.swift
//  Todos
//
//  Created by Егор Дубина on 05.07.2024.
//

import SwiftUI

struct EditReminder: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var reminder: Reminder
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
                    DatePicker(
                        "Notification",
                        selection: $reminder.notification,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }
            }
            .navigationTitle("Edit reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        //                    reminder = editingReminder
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditReminder(reminder: .sampleData[0])
}
