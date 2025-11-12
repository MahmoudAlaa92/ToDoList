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
