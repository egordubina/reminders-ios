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
    var reminderName: String
    var reminderDescription: String
    let createdAt: Date
    var isCompleted: Bool
    var priority: ReminderPriority
    
    init(id: UUID = UUID(), reminderName: String, reminderDescription: String, createdAt: Date, isCompleted: Bool, priority: ReminderPriority) {
        self.id = id
        self.reminderName = reminderName
        self.reminderDescription = reminderDescription
        self.createdAt = createdAt
        self.isCompleted = isCompleted
        self.priority = priority
    }
}


extension Reminder {
    
    enum ReminderPriority: String, CaseIterable, Codable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }
    
    static var sampleData: [Reminder] = [
        Reminder(reminderName: "First reminder item", reminderDescription: "", createdAt: Date(), isCompleted: true, priority: .low),
        Reminder(reminderName: "Second reminder item", reminderDescription: "", createdAt: Date(), isCompleted: false, priority: .low),
    ]
    
    static var emptyReminder: Reminder = Reminder(reminderName: "", reminderDescription: "", createdAt: Date(), isCompleted: false, priority: .low)
}
