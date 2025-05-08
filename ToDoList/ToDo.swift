//
//  ToDo.swift
//  ToDoList
//
//  Created by Gary Erickson on 5/6/25.
//

import Foundation
import SwiftData


@MainActor
@Model
class ToDo {
    var item: String = ""
    var reminderIsOn = false
    var dueDate = Date.now + 60*60*24
    var notes = ""
    var isComplete = false
    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Date.now + 60*60*24, notes: String = "", isComplete: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isComplete = isComplete
    }
    
}
extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(ToDo(item: "Create SwiftData Lessons", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "some notes", isComplete: false))
        
        container.mainContext.insert(ToDo(item: "Second ToDo ", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "some notes", isComplete: false))
        container.mainContext.insert(ToDo(item: "Third ToDo  SwiftData Lessons", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "some notes", isComplete: false))
        container.mainContext.insert(ToDo(item: "Fourth ToDo Sample data", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "some notes", isComplete: false))
        return container
    }
}
