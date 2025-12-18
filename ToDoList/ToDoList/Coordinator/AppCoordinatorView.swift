//
//  AppCoordinatorView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 08/11/2025.
//

import SwiftUI

struct AppCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator(taskStore: TaskStore())
    
    var body: some View {
        Group {
            switch coordinator.currentAppState {
                
            case .auth:
                NavigationStack(path: $coordinator.authPath) {
                    AuthRoute.login.makeView(coordinator: coordinator)
                        .navigationDestination(for: AuthRoute.self) { route in
                            route.makeView(coordinator: coordinator)
                        }
                }
                .transition(.move(edge: .trailing))
                
            case .main:
                CustomTabBar(coordinator: coordinator)
                    .transition(.move(edge: .trailing))
            }
        }
        .sheet(item: $coordinator.sheet) { route in
            NavigationStack {
                route.makeView(coordinator: coordinator)
            }
        }
        .fullScreenCover(item: $coordinator.fullScreen) { route in
            NavigationStack {
                route.makeView(coordinator: coordinator)
            }
        }
        .environmentObject(coordinator)
    }
}
