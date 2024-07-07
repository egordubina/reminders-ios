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
    @Attribute(.unique) let id: UUID
    var reminder: String
    var notes: String
    let createdAt: Date
    var isCompleted: Bool
    var priority: ReminderPriority
    var flag: Bool
    
    init(id: UUID = UUID(), reminderName: String, reminderDescription: String, createdAt: Date, isCompleted: Bool, priority: ReminderPriority, flag: Bool) {
        self.id = id
        self.reminder = reminderName
        self.notes = reminderDescription
        self.createdAt = createdAt
        self.isCompleted = isCompleted
        self.priority = priority
        self.flag = flag
    }
}


extension Reminder {
    
    enum ReminderPriority: String, CaseIterable, Codable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }
    
    static var sampleData: [Reminder] = [
        Reminder(reminderName: "First reminder item", reminderDescription: "", createdAt: Date(), isCompleted: true, priority: .low, flag: true),
        Reminder(reminderName: "Second reminder item", reminderDescription: "", createdAt: Date(), isCompleted: false, priority: .medium, flag: false),
        Reminder(reminderName: "Third reminder item", reminderDescription: "", createdAt: Date(), isCompleted: false, priority: .high, flag: true),
    ]
    
    static var emptyReminder: Reminder = Reminder(reminderName: "", reminderDescription: "", createdAt: Date(), isCompleted: false, priority: .low, flag: false)
}
