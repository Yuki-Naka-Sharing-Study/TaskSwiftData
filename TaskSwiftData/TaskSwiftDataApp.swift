//
//  TaskSwiftDataApp.swift
//  TaskSwiftData
//
//  Created by 仲優樹 on 2025/07/01.
//

import SwiftUI
import SwiftData

@main
struct TaskSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
        .modelContainer(for: TaskItem.self)
    }
}
