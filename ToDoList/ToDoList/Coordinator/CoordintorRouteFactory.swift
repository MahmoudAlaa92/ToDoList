//
//  CoordintorRouteFactory.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 12/11/2025.
//

import SwiftUI

enum CoordintorRouteFactory {
    static func createNotificationRoute(for tab: Tabs) -> any (Route & ViewBuildable & TabIdentifiable) {
        switch tab {
        case .home:
            return HomeTabRoute.notification
        case .today:
            break
        case .addTask:
            break
        case .prioritiesTask:
            break
        case .planned:
            return PlannedTabRoute.notification
        }
        return PlannedTabRoute.notification
    }
    
    static func createProjectDetailsRoute(for tab: Tabs, taskCard: PlannedModel) -> any (Route & ViewBuildable & TabIdentifiable) {
        switch tab {
        case .home:
            return HomeTabRoute.projectDetails(taskCard: taskCard)
        case .today:
            break
        case .addTask:
            break
        case .prioritiesTask:
            break
        case .planned:
            return PlannedTabRoute.projectDetails(taskCard: taskCard)
        }
        return PlannedTabRoute.projectDetails(taskCard: taskCard)
    }
}



