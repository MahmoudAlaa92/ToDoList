//
//  AuthRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 08/11/2025.
//

import SwiftUI

// MARK: - Auth Routes

enum AuthRoute: Route, ViewBuildable {
    
    case login
    case signup
    
    var id: String {
        switch self {
        case .login: return "login"
        case .signup: return "signup"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        switch self {
      
        case .login:
            LogInView(coordinator: coordinator)
        case .signup:
            SignUp(coordinator: coordinator)

        }
    }
}

// MARK: - Tab Routes (Navigation within tabs)

enum HomeTabRoute: Route, ViewBuildable {
    case profile
    case notification
    
    
    var id: String {
        switch self {
        case .profile: return "home-profile"
        case .notification: return "home-notification"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        switch self {
            
        case .profile:
            ProfileView(coordinator: coordinator)
        case .notification:
            NotificationView(viewModel: NotificationViewModel(), coordinator: coordinator)
        }
    }
}

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

enum PlannedTabRoute: Route, ViewBuildable {
    case taskDetails(String)
    case calendarView
    case editTask(String)
    
    var id: String {
        switch self {
        case .taskDetails(let id): return "planned-task-\(id)"
        case .calendarView: return "planned-calendar"
        case .editTask(let id): return "planned-edit-\(id)"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        EmptyView()
//        switch self {
//        case .taskDetails(let id):
//            TaskDetailsView(taskId: id, coordinator: coordinator)
//        case .calendarView:
//            CalendarFullView(coordinator: coordinator)
//        case .editTask(let id):
//            EditTaskView(taskId: id, coordinator: coordinator)
//        }
    }
}

// MARK: - Modal Routes (Can be presented from anywhere)

enum ModalRoute: Route, ViewBuildable {
    case addTask
    
    var id: String {
        switch self {
        case .addTask: return "modal-add-task"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        switch self {
        case .addTask:
            AddTask(coordinator: coordinator)

        }
    }
}
