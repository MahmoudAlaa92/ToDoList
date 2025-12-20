//
//  PlannedTabRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

enum PlannedTabRoute: Route, ViewBuildable, TabIdentifiable {
    case profile
    case notification
    case projectDetails(taskCard: PlannedModel)
        
    var tab: Tabs { .planned }

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
            ProfileView(sourceTab: tab, coordinator: coordinator)
        case .notification:
            NotificationView(
                viewModel: NotificationViewModel(
                    sourceTab: tab,
                    coordinator: coordinator,
                    dataProvider: NotificationDataProvider.shared
                )
            )
        case .projectDetails(let taskCard):
            ProjectDetails(taskCard: taskCard, coordinator: coordinator, sourceTab: .planned)
        }
    }
}
