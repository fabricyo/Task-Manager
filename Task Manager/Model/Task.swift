//
//  Task.swift
//  Task Manager
//
//  Created by Fabricyo Figueira on 26/07/23.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompleted: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(taskTitle: "Record video", creationDate: .updateHour(-5), isCompleted: true, tint: .taskColor1),
    .init(taskTitle: "Redesign website", creationDate: .updateHour(-3), isCompleted: false, tint: .taskColor2),
    .init(taskTitle: "Do an app", creationDate: .updateHour(-4), isCompleted: true, tint: .taskColor3),
    .init(taskTitle: "Study", creationDate: .updateHour(0), isCompleted: false, tint: .taskColor4),
    .init(taskTitle: "Study more", creationDate: .updateHour(3), isCompleted: true, tint: .taskColor4),
    .init(taskTitle: "Play PS5", creationDate: .updateHour(2), isCompleted: false, tint: .taskColor1),
    .init(taskTitle: "Learn piano", creationDate: .updateHour(1), isCompleted: true, tint: .taskColor5)
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}

