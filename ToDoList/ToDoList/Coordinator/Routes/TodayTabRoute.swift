//
//  TodayTabRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

enum TodayTabRoute: Route, ViewBuildable, TabIdentifiable {
    
    case projectDetails(taskCard: PlannedModel)

    var tab: Tabs { .today }
    
    var id: String {
        switch self {
        case .projectDetails: return "home-projectDetails"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {

        switch self {
        case .projectDetails(taskCard: let task):
            ProjectDetails(taskCard: task, coordinator: coordinator, sourceTab: .today)
        }
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
    }
}
