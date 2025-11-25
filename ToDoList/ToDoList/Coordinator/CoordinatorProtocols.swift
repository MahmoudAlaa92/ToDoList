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

protocol CoordinatorProtocol: AnyObject {
    // State management
    var currentAppState: AppCoordinator.AppState { get set }

    // Tab navigation
    func push<R: TabIdentifiable & Hashable>(_ route: R)
    func goBack(from tab: Tabs)
    func popToRoot(tab: Tabs)

    // Auth navigation
    func pushAuth(_ route: AuthRoute)
    func goBackAuth()
    func resetAuthPath()

    // Modal presentation
    func presentSheet(_ route: ModalRoute)
    func dismissSheet()
    func presentFullScreen(_ route: AuthRoute)
    func dismissFullScreen()

    // Specific app features
    func pushNotification(for tab: Tabs)
    func pushProjectDetails(for tab: Tabs, taskCard: PlannedModel)
    func pushCreatedTaskView(for tab: Tabs, taskCard: PlannedModel)
    func pushProfileView(for tab: Tabs) 
}
