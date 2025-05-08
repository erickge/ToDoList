//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Gary Erickson on 5/5/25.
//

import SwiftUI
import SwiftData


@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    init() {
        print("/n Starting ToDoListApp")
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
