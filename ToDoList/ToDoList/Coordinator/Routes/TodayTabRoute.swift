//
//  TodayTabRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

enum TodayTabRoute: Route, ViewBuildable, TabIdentifiable {
    
    case notification
    case projectDetails(taskCard: PlannedModel)

    var tab: Tabs { .today }
    
    var id: String {
        switch self {
        case .notification: return "home-notification"
        case .projectDetails: return "home-projectDetails"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {

        switch self {
        case .notification:
            NotificationView(
                viewModel: NotificationViewModel(
                    sourceTab: tab,
                    coordinator: coordinator,
                    dataProvider: NotificationDataProvider.shared
                )
            )
            
        case .projectDetails(taskCard: let task):
            ProjectDetails(taskCard: task, coordinator: coordinator, sourceTab: tab)
        }
    }
}
