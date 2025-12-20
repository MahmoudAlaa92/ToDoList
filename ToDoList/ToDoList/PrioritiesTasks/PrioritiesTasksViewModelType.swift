//
//  PrioritiesTasksViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine

// MARK: - Input Protocol
protocol PrioritiesTasksViewModelInput: ObservableObject {
    func deleteTask(at index: Int)
    func selectPriority(at index: Int?)
    func didTapNotification()
    func didTapTaskCard(_ task: PlannedModel)
    func didTapSeeAllProjects()
    func didTapProjetCell(item: PlannedModel)
}

// MARK: - Output Protocol
protocol PrioritiesTasksViewModelOutput: ObservableObject {
    var priorityItems: [PriorityModel] { get }
    var priorityTasks: [PlannedModel] { get }
    var projectItems: [PlannedModel] { get }
    var selectedPriorityIndex: Int? { get }
}

// MARK: - Protocol with Coordinator
protocol PrioritiesTasksViewModelType: PrioritiesTasksViewModelInput, PrioritiesTasksViewModelOutput {
    var coordinator: CoordinatorProtocol? { get set }
    var sourceTab: Tabs { get }
}
