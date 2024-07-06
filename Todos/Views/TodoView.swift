//
//  TodoView.swift
//  Todos
//
//  Created by Егор Дубина on 03.07.2024.
//

import SwiftUI

struct TodoView: View {
    @State var todo: Reminder
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle").foregroundColor(todo.isCompleted ? .green : .accentColor)
                Text(todo.reminderName)
                Spacer()
            }
            Text(todo.createdAt, format: Date.FormatStyle(date: .abbreviated, time: .shortened)).font(.caption).padding(.top, 1)
        }
    }
}

#Preview {
    TodoView(todo: .sampleData[0])
    TodoView(todo: .sampleData[1])
}
