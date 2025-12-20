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
    @EnvironmentObject var taskStore: TaskStore
    @State private var selectedTab: Tabs = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", image: "home", value: .home) {
                NavigationStack(path: $coordinator.homeTabPath) {
                    HomeView(coordinator: coordinator, taskStore: taskStore)
                        .navigationDestination(for: HomeTabRoute.self) {
                            route in
                            route.makeView(coordinator: coordinator)
                        }
                }
            }

            Tab("Today", image: "calender2", value: .today) {
                NavigationStack(path: $coordinator.todayTabPath) {
                    AllTasksView(
                        viewModel: AllTasksViewModel(
                            coordinator: coordinator,
                            dataProvider: AllTasksDataProvider.shared
                        )
                    )
                    .navigationDestination(for: TodayTabRoute.self) { route in
                        route.makeView(coordinator: coordinator)
                    }
                }
            }

            Tab("AddTask", image: "addIcon", value: .addTask) {
                NavigationStack(path: $coordinator.addTaskPath) {
                    AddTask(
                        coordinator: coordinator,
                        viewModel: AddTaskViewModel(taskStore: taskStore)
                    )
                    .navigationDestination(for: AddTaskRoute.self) { route in
                        route.makeView(coordinator: coordinator)
                    }
                }
            }

            Tab("Priorities", image: "flag2", value: .prioritiesTask) {
                NavigationStack(path: $coordinator.prioritiesTabPath) {
                    PrioritiesTasksView(
                        viewModel: PrioritiesTasksViewModel(
                            sourceTab: .prioritiesTask,
                            coordinator: coordinator,
                            dataProvider: PrioritiesTasksDataProvider.shared
                        )
                    )
                    .navigationDestination(for: PrioritiesTabRoute.self) {
                        route in
                        route.makeView(coordinator: coordinator)
                    }
                }
            }

            Tab("Planned", image: "planned", value: .planned) {
                NavigationStack(path: $coordinator.plannedTabPath) {
                    PlannedView(
                        viewModel: PlannedViewModel(
                            coordinator: coordinator,
                            dataProvider: PlannedDataProvider.shared
                        )
                    )
                    .navigationDestination(for: PlannedTabRoute.self) { route in
                        route.makeView(coordinator: coordinator)
                    }
                }
            }
        }
        .tint(Color.primaryApp)
    }
}
