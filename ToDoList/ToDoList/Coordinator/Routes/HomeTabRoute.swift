//
//  HomeTabRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

enum HomeTabRoute: Route, ViewBuildable, TabIdentifiable {
    case profile
    case notification
    case projectDetails(taskCard: PlannedModel)

    var tab: Tabs { .home }

    var id: String {
        switch self {
        case .profile: return "home-profile"
        case .notification: return "home-notification"
        case .projectDetails: return "home-projectDetails"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {
        switch self {
            
        case .profile:
            ProfileView(coordinator: coordinator)
        case .notification:
            NotificationView(viewModel: NotificationViewModel(), coordinator: coordinator, sourceTab: .home)        
        case .projectDetails(let taskCard):
            ProjectDetails(taskCard: taskCard, coordinator: coordinator, sourceTab: .home)
        }
    }
}
