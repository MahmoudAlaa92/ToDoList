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
            ProfileView(
                viewModel: ProfileViewModel(
                    sourceTab: tab,
                    coordinator: coordinator,
                    dataProvider: ProfileDataProvider.shared
                )
            )
        case .notification:
            NotificationView(
                viewModel: NotificationViewModel(
                    sourceTab: tab,
                    coordinator: coordinator,
                    dataProvider: NotificationDataProvider.shared
                )
            )
        case .projectDetails(let taskCard):
            ProjectDetailsView(
                viewModel: ProjectDetailsViewModel(
                    taskCard: taskCard,
                    sourceTab: tab,
                    coordinator: coordinator,
                    dataProvider: ProjectDetailsDataProvider.shared
                )
            )
        }
    }
}
