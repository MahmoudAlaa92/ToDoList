//
//  TodayTabRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

enum TodayTabRoute: Route, ViewBuildable {
    case taskDetails(String)
    case editTask(String)
    case filterTasks
    
    var id: String {
        switch self {
        case .taskDetails(let id): return "today-task-\(id)"
        case .editTask(let id): return "today-edit-\(id)"
        case .filterTasks: return "today-filter"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        EmptyView()
//        switch self {
//        case .taskDetails(let id):
//            TaskDetailsView(taskId: id, coordinator: coordinator)
//        case .editTask(let id):
//            EditTaskView(taskId: id, coordinator: coordinator)
//        case .filterTasks:
//            FilterTasksView(coordinator: coordinator)
//        }
    }
}

enum AddTaskRoute: Route, ViewBuildable {
    case taskDetails(String)
    case editTask(String)
    case filterTasks
    
    var id: String {
        switch self {
        case .taskDetails(let id): return "today-task-\(id)"
        case .editTask(let id): return "today-edit-\(id)"
        case .filterTasks: return "today-filter"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        EmptyView()
//        switch self {
//        case .taskDetails(let id):
//            TaskDetailsView(taskId: id, coordinator: coordinator)
//        case .editTask(let id):
//            EditTaskView(taskId: id, coordinator: coordinator)
//        case .filterTasks:
//            FilterTasksView(coordinator: coordinator)
//        }
    }
}
