//
//  PrioritiesTabRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 09/11/2025.
//

import SwiftUI

enum PrioritiesTabRoute: Route, ViewBuildable, TabIdentifiable {
    case notification
    case projectDetails(taskCard: PlannedModel)
    case myProjectsView
    case createdTaskView(taskCard: PlannedModel)
    
    var tab: Tabs { .prioritiesTask }
    
    var id: String {
        switch self {
        case .notification: return "home-notification"
        case .projectDetails: return "home-projectDetails"
        case .myProjectsView: return "myProjects-View"
        case .createdTaskView: return "Priorities-createdTaskView"
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
            ProjectDetailsView(
                viewModel: ProjectDetailsViewModel(
                    taskCard: task,
                    sourceTab: tab,
                    coordinator: coordinator,
                    dataProvider: ProjectDetailsDataProvider.shared
                )
            )
            
        case .myProjectsView:
            MyProjectView(viewModel: MyProjectViewModel(sourceTab: tab,
                                                        coordinator: coordinator,
                                                        dataProvider: MyProjectDataProvider.shared))
        case .createdTaskView(taskCard: let taskCard):
            CreatedTaskView(viewModel: CreatedTaskViewModel(taskItem: taskCard,
                                                            sourceTab: tab,
                                                            coordinator: coordinator,
                                                            dataProvider: CreatedTaskDataProvider.shared))
        }
    }
}
