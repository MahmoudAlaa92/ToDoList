//
//  AddTaskRoute.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 21/11/2025.
//

import SwiftUI

enum AddTaskRoute: Route, ViewBuildable, TabIdentifiable {
    case notification
    case selectTime
  
    var tab: Tabs { .addTask }
    
    var id: String {
        switch self {
        case .notification: return "home-notification"
        case .selectTime: return "select-time"
        }
    }
    
    @ViewBuilder
    func makeView(coordinator: AppCoordinator) -> some View {

        switch self {
        case .notification:
            NotificationView(viewModel: NotificationViewModel(), coordinator: coordinator, sourceTab: tab)
        case .selectTime:
            SelectTime()
        }
    }
}
