//
//  CreatedTaskViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 11/11/2025.
//

import Combine
import SwiftUI

@MainActor
final class CreatedTaskViewModel: CreatedTaskViewModelType {
    
    // MARK: - Dependencies
    private let dataProvider: CreatedTaskDataProviderProtocol
    weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Output Properties
    let taskItem: PlannedModel
    let sourceTab: Tabs
    let assignedPersons: [String]
    @Published var plannedTasks: [PlannedModel]
    
    // MARK: - Init
    init(
        taskItem: PlannedModel,
        sourceTab: Tabs,
        coordinator: CoordinatorProtocol? = nil,
        dataProvider: CreatedTaskDataProviderProtocol
    ) {
        self.taskItem = taskItem
        self.sourceTab = sourceTab
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        
        // Fetch data from data provider
        self.plannedTasks = dataProvider.fetchPlannedTasks()
        self.assignedPersons = dataProvider.fetchAssignedPersons()
    }
}

// MARK: - Input Methods
extension CreatedTaskViewModel {
    func deleteTask(at index: Int) {
        guard index >= 0 && index < plannedTasks.count else { return }
        plannedTasks.remove(at: index)
    }
    
    func didTapBack() {
        coordinator?.goBack(from: .home)
    }
    
    func didTapNotification() {
        coordinator?.pushNotification(for: sourceTab)
    }
    
    func didTapAddProject() {
        // Implement add project logic here
        // coordinator?.pushAddProject()
        print("Add project tapped")
    }
}
