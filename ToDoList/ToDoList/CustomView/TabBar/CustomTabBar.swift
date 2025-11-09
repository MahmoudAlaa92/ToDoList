//
//  CustomTabBar.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 08/11/2025.
//

import SwiftUI

enum Tabs {
    case home, today, addTask, prioritiesTask, planned
}

struct CustomTabBar: View {
    @ObservedObject var coordinator: AppCoordinator
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", image: "home", value: .home) {
                NavigationStack(path: $coordinator.homeTabPath) {
                    HomeView(viewModel: HomeViewModel(), coordinator: coordinator)
                        .navigationDestination(for: HomeTabRoute.self) { route in
                            route.makeView(coordinator: coordinator)
                        }
                }
            }
            
            Tab("Today", image: "calender2", value: .today) {
                NavigationStack(path: $coordinator.todayTabPath) {
                    AllTasksView(viewModel: AllTasksViewModel(), coordinator: coordinator)
                        .navigationDestination(for: TodayTabRoute.self) { route in
                            route.makeView(coordinator: coordinator)
                        }
                }
            }
            
            Tab("AddTask", image: "addIcon", value: .addTask) {
                Color.clear
                    .onAppear {
                        coordinator.showAddTask()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            selectedTab = .home
                        }
                    }
            }
            
            Tab("Priorities", image: "flag2", value: .prioritiesTask) {
                NavigationStack(path: $coordinator.prioritiesTabPath) {
                    PrioritiesTasksView(viewModel: PrioritiesTasksViewModel(), coordinator: coordinator)
                        .navigationDestination(for: PrioritiesTabRoute.self) { route in
                            route.makeView(coordinator: coordinator)
                        }
                }
            }
            
            Tab("Planned", image: "planned", value: .planned) {
                NavigationStack(path: $coordinator.plannedTabPath) {
                    PlannedView(PlannedVM: PlannedViewModel(), coordinator: coordinator)
                        .navigationDestination(for: PlannedTabRoute.self) { route in
                            route.makeView(coordinator: coordinator)
                        }
                }
            }
        }
        .tint(Color.primaryApp)
    }
}

