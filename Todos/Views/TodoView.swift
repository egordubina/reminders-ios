//
//  TodoView.swift
//  Todos
//
//  Created by Егор Дубина on 03.07.2024.
//

import SwiftUI

struct TodoView: View {
    @State var reminder: Reminder
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Reminder", text: $reminder.reminder)
            TextField("Notes", text: $reminder.notes).font(.caption)
            Text(reminder.createdAt, format: Date.FormatStyle(date: .abbreviated, time: .shortened)).font(.caption).padding(.top, 1)
        }
    }
}

#Preview {
    TodoView(reminder: .sampleData[0])
    TodoView(reminder: .sampleData[1])
}
