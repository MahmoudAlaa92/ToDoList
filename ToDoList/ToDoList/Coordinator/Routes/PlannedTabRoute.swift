//
//  PlannedTabRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

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
