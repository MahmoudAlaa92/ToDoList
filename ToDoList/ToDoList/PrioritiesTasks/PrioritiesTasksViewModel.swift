//
//  PrioritiesTasksViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI
import Combine

@MainActor
final class PrioritiesTasksViewModel: PrioritiesTasksViewModelType {
    
    // MARK: - Dependencies
    private let dataProvider: PrioritiesTasksDataProviderProtocol
    weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Output Properties
    let sourceTab: Tabs
    @Published var priorityItems: [PriorityModel]
    @Published var priorityTasks: [PlannedModel]
    @Published var projectItems: [PlannedModel]
    @Published var selectedPriorityIndex: Int? = 0
    
    // MARK: - Initialization
    init(
        sourceTab: Tabs,
        coordinator: CoordinatorProtocol?,
        dataProvider: PrioritiesTasksDataProviderProtocol
    ) {
        self.sourceTab = sourceTab
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        
        /// Fetch data from data provider
        self.priorityItems = dataProvider.fetchPriorityItems()
        self.priorityTasks = dataProvider.fetchPriorityTasks()
        self.projectItems = dataProvider.fetchProjects()
    }
}

// MARK: - Input Methods
extension PrioritiesTasksViewModel {
    func deleteTask(at index: Int) {
        guard index >= 0 && index < priorityTasks.count else { return }
        priorityTasks.remove(at: index)
        updatePriorityItemsCount()
    }
    
    func selectPriority(at index: Int?) {
        selectedPriorityIndex = (selectedPriorityIndex == index ? nil : index)
    }
    
    func didTapNotification() {
        coordinator?.pushNotification(for: .prioritiesTask)
    }
    
    func didTapTaskCard(_ task: PlannedModel) {
        coordinator?.pushProjectDetails(for: .prioritiesTask, taskCard: task)
    }
    
    func didTapSeeAllProjects() {
        coordinator?.myProjectsView(for: .prioritiesTask)
    }
    
    func didTapProjetCell(item: PlannedModel) {
        coordinator?.pushCreatedTaskView(for: sourceTab, taskCard: item)
    }
}
// MARK: - Private Methods
//
private extension PrioritiesTasksViewModel {
    
    func updatePriorityItemsCount() {
        // Update the count in priority items based on current tasks
        if let allIndex = priorityItems.firstIndex(where: { $0.title == L10n.Tasks.seeAll }) {
            priorityItems[allIndex].number = priorityTasks.count
        }
    }
}
