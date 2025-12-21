//
//  HomeFactory.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 21/12/2025.
//

import Foundation

struct HomeFactory {
    static func create(
        coordinator: CoordinatorProtocol?,
        taskStore: TaskStore
    ) -> HomeView {
        let dataProvider = HomeDataProvider(taskStore: taskStore)
        let viewModel = HomeViewModel(dataProvider: dataProvider)
        return HomeView(viewModel: viewModel, coordinator: coordinator)
    }
}
