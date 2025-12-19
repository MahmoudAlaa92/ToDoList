//
//  AllTasksViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 02/11/2025.
//

import SwiftUI
import Combine

@MainActor
final class AllTasksViewModel: AllTasksViewModelType {
    
    // MARK: - Dependencies
    private let dataProvider: AllTasksDataProviderProtocol
    weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Output Properties
    let days: [CalenderModel]
    @Published var prioritieItems: [PriorityModel]
    @Published var prioritiesTasks: [PlannedModel]
    @Published var selectedPriorityIndex: Int? = 0

    // MARK: - Init
    init(
        coordinator: CoordinatorProtocol? = nil,
        dataProvider: AllTasksDataProviderProtocol
    ) {
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        self.days = dataProvider.fetchCalendarDays()
        self.prioritieItems = dataProvider.fetchPriorityItems()
        self.prioritiesTasks = dataProvider.fetchTasks()
    }
}
// MARK: - Input Methods
//
extension AllTasksViewModel {
    func deleteTask(at index: Int) {
        guard index >= 0 && index < prioritiesTasks.count else { return }
        prioritiesTasks.remove(at: index)
    }
    
    func selectPriority(at index: Int?) {
        selectedPriorityIndex = (selectedPriorityIndex == index ? nil : index)
    }
    
    func didTapScheduleTask(_ task: PlannedModel) {
        coordinator?.pushProjectDetails(for: .today, taskCard: task)
    }
    
    func didTapNotification() {
        coordinator?.pushNotification(for: .today)
    }
}
