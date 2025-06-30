//
//  TaskItem.swift
//  TaskSwiftData
//
//  Created by 仲優樹 on 2025/07/01.
//

import Foundation
import SwiftData

@Model
class TaskItem {
    @Attribute(.unique) var id: UUID
    var title: String
    var isDone: Bool
    @Transient var isSelected: Bool = false  // 保存しない一時的状態
    
    init(title: String, isDone: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
}
