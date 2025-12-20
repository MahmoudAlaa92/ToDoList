//
//  CreatedTaskViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine

// MARK: - Input Protocol
protocol CreatedTaskViewModelInput: ObservableObject {
    func deleteTask(at index: Int)
    func didTapBack()
    func didTapNotification()
    func didTapAddProject()
}

// MARK: - Output Protocol
protocol CreatedTaskViewModelOutput: ObservableObject {
    var taskItem: PlannedModel { get }
    var plannedTasks: [PlannedModel] { get }
    var assignedPersons: [String] { get }
}

// MARK: - Combined Protocol
protocol CreatedTaskViewModelType: CreatedTaskViewModelInput, CreatedTaskViewModelOutput {
    var coordinator: CoordinatorProtocol? { get set }
    var sourceTab: Tabs { get }
}
