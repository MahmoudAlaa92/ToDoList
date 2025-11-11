//
//  PrioritiesTabRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

enum PrioritiesTabRoute: Route, ViewBuildable {
    case taskDetails(String)
    case projectDetails(String)
    case editTask(String)
    
    var id: String {
        switch self {
        case .taskDetails(let id): return "priority-task-\(id)"
        case .projectDetails(let id): return "priority-project-\(id)"
        case .editTask(let id): return "priority-edit-\(id)"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        EmptyView()
//        switch self {
//        case .taskDetails(let id):
//            TaskDetailsView(taskId: id, coordinator: coordinator)
//        case .projectDetails(let id):
//            ProjectDetailsView(projectId: id, coordinator: coordinator)
//        case .editTask(let id):
//            EditTaskView(taskId: id, coordinator: coordinator)
//        }
    }
}
