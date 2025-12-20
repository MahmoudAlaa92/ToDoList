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
    case myProjectsView

    var tab: Tabs { .home }

    var id: String {
        switch self {
        case .notification: return "home-notification"
        case .projectDetails: return "home-projectDetails"
        case .createdTaskView: return "home-CreatedTaskView"
        case .profilePicture: return "profile-Picture"
        case .myProjectsView: return "MyProjects-View"
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

        case .projectDetails(let taskCard):
            ProjectDetailsView(
                viewModel: ProjectDetailsViewModel(
                    taskCard: taskCard,
                    sourceTab: tab,
                    coordinator: coordinator,
                    dataProvider: ProjectDetailsDataProvider.shared
                )
            )

        case .createdTaskView(let taskCard):
            CreatedTaskView(
                viewModel: CreatedTaskViewModel(
                    taskItem: taskCard,
                    sourceTab: tab,
                    coordinator: coordinator,
                    dataProvider: CreatedTaskDataProvider.shared
                )
            )
        case .profilePicture:
            ProfileView(sourceTab: tab, coordinator: coordinator)

        case .myProjectsView:
            MyProjectView(
                viewModel: MyProjectViewModel(
                    sourceTab: tab,
                    coordinator: coordinator,
                    dataProvider: MyProjectDataProvider.shared
                )
            )
        }
    }
}
