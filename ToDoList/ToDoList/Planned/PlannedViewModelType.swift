//
//  PlannedViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine

// MARK: - Input Protocol
protocol PlannedViewModelInput: ObservableObject {
    func deleteTask(at index: Int)
    func didTapNotification()
    func didTapTaskCard(_ task: PlannedModel)
    func didTapSearch()
    func refreshTasks()
}

// MARK: - Output Protocol
protocol PlannedViewModelOutput: ObservableObject {
    var plannedTasks: [PlannedModel] { get }
}

// MARK: - Protocol with Coordinator
protocol PlannedViewModelType: PlannedViewModelInput, PlannedViewModelOutput  {
    var coordinator: CoordinatorProtocol? { get set }
}
