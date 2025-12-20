//
//  PlannedViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 01/11/2025.
//

import SwiftUI
import Combine

final class PlannedViewModel: PlannedViewModelType {
    
    // MARK: - Dependencies
    private let dataProvider: PlannedDataProviderProtocol
    weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Output Properties
    @Published var plannedTasks: [PlannedModel]
    
    // MARK: - Initialization
    init(
        coordinator: CoordinatorProtocol?,
        dataProvider: PlannedDataProviderProtocol
    ) {
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        
        // Fetch data from data provider
        self.plannedTasks = dataProvider.fetchPlannedTasks()
    }
}
// MARK: - Input Methods
//
extension PlannedViewModel {
    func deleteTask(at index: Int) {
        guard index >= 0 && index < plannedTasks.count else { return }
        plannedTasks.remove(at: index)
    }
    
    func didTapNotification() {
        coordinator?.pushNotification(for: .planned)
    }
    
    func didTapTaskCard(_ task: PlannedModel) {
        coordinator?.pushProjectDetails(for: .planned, taskCard: task)
    }
    
    func didTapSearch() {
        print("Search tapped")
    }
    
    func refreshTasks() {
        plannedTasks = dataProvider.fetchPlannedTasks()
    }
}

// MARK: - Private Methods
private extension PlannedViewModel {
    func filterTasks(by searchText: String) -> [PlannedModel] {
        guard !searchText.isEmpty else { return plannedTasks }
        
        return plannedTasks.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.subTitle.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func sortTasksByDate() {
        // plannedTasks.sort { ... }
    }
    
    func addNewTask(_ task: PlannedModel) {
        plannedTasks.append(task)
    }
}
