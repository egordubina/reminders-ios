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
                TextField("Name", text: $reminder.reminder)
                TextField("Description", text: $reminder.notes, axis: .vertical).lineLimit(5...10)
                Toggle(isOn: $reminder.flag) { Text("Flag") }
                Picker("Priority", selection: $reminder.priority) {
                    ForEach(Reminder.ReminderPriority.allCases, id: \.self) {
                        Text($0.rawValue).tag($0)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditReminder(reminder: .emptyReminder)
    }
}
