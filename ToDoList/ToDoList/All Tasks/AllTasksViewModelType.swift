//
//  AllTasksViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine

// MARK: - Input Protocol
protocol AllTasksViewModelInput: ObservableObject {
    func deleteTask(at index: Int)
    func selectPriority(at index: Int?)
    func didTapScheduleTask(_ task: PlannedModel)
    func didTapNotification()
}

// MARK: - Output Protocol
protocol AllTasksViewModelOutput: ObservableObject {
    var days: [CalenderModel] { get }
    var prioritieItems: [PriorityModel] { get }
    var prioritiesTasks: [PlannedModel] { get }
    var selectedPriorityIndex: Int? { get }
}

// MARK: - Combined Protocol
protocol AllTasksViewModelType: AllTasksViewModelInput, AllTasksViewModelOutput, ObservableObject {
    var coordinator: CoordinatorProtocol? { get set }
}
