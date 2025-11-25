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
    case profilePicture
    
    var tab: Tabs { .home }
    
    var id: String {
        switch self {
        case .notification: return "home-notification"
        case .projectDetails: return "home-projectDetails"
        case .createdTaskView: return "home-CreatedTaskView"
        case .profilePicture: return "profile-Picture"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        switch self {
        case .notification:
            NotificationView(viewModel: NotificationViewModel(), coordinator: coordinator, sourceTab: tab)
            
        case .projectDetails(let taskCard):
            ProjectDetails(taskCard: taskCard, coordinator: coordinator, sourceTab: tab)
            
        case .createdTaskView(taskCard: let taskCard):
            CreatedTaskView(viewModel: CreatedTaskViewModel(), taskItem: taskCard, coordinator: coordinator, sourceTab: tab)
        case .profilePicture:
            ProfileView(sourceTab: tab, coordinator: coordinator)
        }
    }
}
