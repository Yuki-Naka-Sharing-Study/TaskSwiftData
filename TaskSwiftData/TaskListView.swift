//
//  TaskListView.swift
//  TaskSwiftData
//
//  Created by 仲優樹 on 2025/07/01.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    @Environment(\.modelContext) private var context
    @Query private var tasks: [TaskItem]
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("新しいタスクを入力", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("追加") {
                        guard !newTaskTitle.isEmpty else { return }
                        let task = TaskItem(title: newTaskTitle)
                        context.insert(task)
                        newTaskTitle = ""
                    }
                }
                .padding()
                
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Button(action: {
                                task.isDone.toggle()
                            }) {
                                Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isDone ? .green : .gray)
                            }
                            
                            Text(task.title)
                                .strikethrough(task.isDone)
                                .foregroundColor(task.isDone ? .gray : .primary)
                            
                            Spacer()
                            
                            Button(action: {
                                task.isSelected.toggle()  // Transient の使用例
                            }) {
                                Image(systemName: task.isSelected ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            context.delete(tasks[index])
                        }
                    }
                }
            }
            .navigationTitle("タスク一覧")
        }
    }
}
