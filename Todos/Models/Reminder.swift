//
//  TodoItem.swift
//  Todos
//
//  Created by Егор Дубина on 03.07.2024.
//

import Foundation
import SwiftData

@Model
final class Reminder: Identifiable {
    @Attribute(.unique) var id: String
    var reminder: String
    var notes: String
    var createdAt: Date
    var isCompleted: Bool
    var priority: ReminderPriority
    var flag: Bool
    var notification: Date
    
    init(id: String = UUID().uuidString, reminderName: String, reminderDescription: String, createdAt: Date, isCompleted: Bool, priority: ReminderPriority, flag: Bool, notification: Date) {
        self.id = id
        self.reminder = reminderName
        self.notes = reminderDescription
        self.createdAt = createdAt
        self.isCompleted = isCompleted
        self.priority = priority
        self.flag = flag
        self.notification = notification
    }
}


extension Reminder {
    
    enum ReminderPriority: String, CaseIterable, Codable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }

    static var emptyReminder: Reminder { Reminder(reminderName: "", reminderDescription: "", createdAt: Date(), isCompleted: false, priority: .low, flag: false, notification: Date()) }
}

extension Reminder {
#if DEBUG
    static let sampleData: [Reminder] = [
        Reminder(reminderName: "First reminder item", reminderDescription: "", createdAt: Date(), isCompleted: true, priority: .low, flag: true, notification: Date()),
        Reminder(reminderName: "Second reminder item", reminderDescription: "", createdAt: Date(), isCompleted: false, priority: .medium, flag: false, notification: Date()),
        Reminder(reminderName: "Third reminder item", reminderDescription: "", createdAt: Date(), isCompleted: false, priority: .high, flag: true, notification: Date()),
    ]
#endif
}
