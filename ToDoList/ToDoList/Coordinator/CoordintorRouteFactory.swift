//
//  CoordintorRouteFactory.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 12/11/2025.
//

import SwiftUI

enum CoordintorRouteFactory {
    static func notificationRouteFactory(for tab: Tabs) -> any (Route & ViewBuildable & TabIdentifiable) {
        switch tab {
        case .home:
            return HomeTabRoute.notification
        case .today:
            return TodayTabRoute.notification
        case .addTask:
            return AddTaskRoute.notification
        case .prioritiesTask:
            return PrioritiesTabRoute.notification
        case .planned:
            return PlannedTabRoute.notification
        }
    }
    
    static func projectDetailsRoutFactory(for tab: Tabs, taskCard: PlannedModel) -> any (Route & ViewBuildable & TabIdentifiable) {
        switch tab {
        case .home:
            return HomeTabRoute.projectDetails(taskCard: taskCard)
        case .today:
            return TodayTabRoute.projectDetails(taskCard: taskCard)
        case .addTask:
            break
        case .prioritiesTask:
            return PrioritiesTabRoute.projectDetails(taskCard: taskCard)
        case .planned:
            return PlannedTabRoute.projectDetails(taskCard: taskCard)
        }
        return PlannedTabRoute.projectDetails(taskCard: taskCard)
    }
    
    static func createdTaskViewRoutFactory(for tab: Tabs, taskCard: PlannedModel) -> any (Route & ViewBuildable & TabIdentifiable) {
        switch tab {
        case .home:
            return HomeTabRoute.createdTaskView(taskCard: taskCard)
        case .today:
            break
        case .addTask:
            break
        case .prioritiesTask:
            return PrioritiesTabRoute.createdTaskView(taskCard: taskCard)
        case .planned:
            break
        }
        return HomeTabRoute.createdTaskView(taskCard: taskCard)
    }
    
    static func createdProfileRoutFactory(for tab: Tabs) -> any (Route & ViewBuildable & TabIdentifiable) {
        switch tab {
        case .home:
            return HomeTabRoute.profilePicture
        case .today:
            break
        case .addTask:
            break
        case .prioritiesTask:
            break
        case .planned:
            break
        }
        return HomeTabRoute.profilePicture
    }
    
    static func myProjectsRoutFactory(for tab: Tabs) -> any (Route & ViewBuildable & TabIdentifiable) {
        switch tab {
        case .home:
            return HomeTabRoute.myProjectsView
        case .today:
            break
        case .addTask:
            break
        case .prioritiesTask:
            return PrioritiesTabRoute.myProjectsView
        case .planned:
            break
        }
        return HomeTabRoute.myProjectsView
    }

}
