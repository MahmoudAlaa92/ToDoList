//
//  HomeTabRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

enum HomeTabRoute: Route, ViewBuildable, TabIdentifiable {
    case notification
    case projectDetails(taskCard: PlannedModel)
    case createdTaskView(taskCard: PlannedModel)
    
    var tab: Tabs { .home }
    
    var id: String {
        switch self {
        case .notification: return "home-notification"
        case .projectDetails: return "home-projectDetails"
        case .createdTaskView: return "home-CreatedTaskView"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        switch self {
        case .notification:
            NotificationView(viewModel: NotificationViewModel(), coordinator: coordinator, sourceTab: .home)
            
        case .projectDetails(let taskCard):
            ProjectDetails(taskCard: taskCard, coordinator: coordinator, sourceTab: .home)
            
        case .createdTaskView(taskCard: let taskCard):
            CreatedTaskView(viewModel: CreatedTaskViewModel(), taskItem: taskCard, coordinator: coordinator, sourceTab: .home)
        }
    }
}
