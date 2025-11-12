//
//  CoordinatorProtocols.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 08/11/2025.
//

import SwiftUI

// MARK: - Base Protocols

/// Base protocol for all routes in the app
protocol Route: Hashable, Identifiable {
    var id: String { get }
}

/// Protocol for routes that can build their own views
protocol ViewBuildable {
    associatedtype Content: View
    @ViewBuilder func makeView(coordinator: AppCoordinator) -> Content
}

/// Protocol to identify which tab a route belongs to
protocol TabIdentifiable {
    var tab: Tabs { get }
}

// MARK: - Route Creation Protocol

/// Protocol for creating routes for specific tabs
protocol TabRouteCreatable {
    static func createForTab(_ tab: Tabs) -> any (Route & ViewBuildable & TabIdentifiable)
}

enum NotificationRouteFactory {
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



