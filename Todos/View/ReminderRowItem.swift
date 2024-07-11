//
//  TodoView.swift
//  Todos
//
//  Created by Егор Дубина on 03.07.2024.
//

import SwiftUI

struct ReminderRowItem: View {
    @State var reminder: Reminder
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if reminder.priority == .medium || reminder.priority == .high {
                    Image(systemName: reminder.priority == .medium ? "exclamationmark.2" : "exclamationmark.3")
                        .foregroundColor(reminder.priority == .medium ? .orange : .red)
                        .bold()
                }
                Text(reminder.reminder).bold(reminder.flag && reminder.priority == .high)
                Spacer()
                if reminder.flag {
                    Image(systemName: "flag.fill").foregroundColor(.orange).bold()
                }
            }
            if !reminder.notes.isEmpty {
                Text(reminder.notes).font(.caption)
            }
            Text(reminder.notification, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
                .font(.caption).padding(.top, 1)
        }
    }
}

#Preview {
    ReminderRowItem(reminder: .sampleData[0])
    ReminderRowItem(reminder: .sampleData[1])
    ReminderRowItem(reminder: .sampleData[2])
}
