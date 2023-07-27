//
//  TaskRowView.swift
//  Task Manager
//
//  Created by Fabricyo Figueira on 26/07/23.
//

import SwiftUI

struct TaskRowView: View {
    @Bindable var task: Task
    /// Model Context
    @Environment(\.modelContext) private var context
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Circle()
                .fill(indicatorColor)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
            /// Invisible button to be more accessible
                .overlay {
                    Circle()
                        .foregroundStyle(.clear)
                        .  contentShape(.circle)
                        .frame(width: 50, height: 50)
                        .blendMode(.destinationOver)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                task.isCompleted.toggle()
                            }
                        }
                }
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .strikethrough(task.isCompleted, pattern: .solid, color: .black)
                
                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.footnote)
                    .foregroundStyle(.black)
            })
            .padding(15)
            .hSpacing(.leading)
            .background(task.tintColor, in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompleted, pattern: .solid, color: .black)
            .contentShape(.contextMenuPreview, .rect(cornerRadius: 15))
            .contextMenu {
                Button( "Delete Task", role: .destructive) {
                    /// Deleting task
                    context.delete(object: task)
                    try? context.save()
                }
            }
            .offset(y: -8)
        }
    }
    
    var indicatorColor: Color {
        if task.isCompleted {
            return .green
        }
        
        return task.creationDate.isSameHour ? .darkBlue : (task.creationDate.isPast ?
            .red : .black)
    }
}

#Preview {
    ContentView()
}
