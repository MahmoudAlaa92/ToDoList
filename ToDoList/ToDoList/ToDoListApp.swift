//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 30/10/2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject private var taskStore = TaskStore()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
                .environmentObject(taskStore)
        }
    }
}
