//
//  AddTaskViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 13/12/2025.
//

import Combine

typealias AddTaskViewModelType = AddTaskViewModelInput & AddTaskViewModelOutput

// MARK: - Input
protocol AddTaskViewModelInput: ObservableObject {
    var taskName: String { get set }
    var taskTitle: String { get set }
    var taskSubTitle: String { get set }
    var taskDescription: String { get set }

    func createTaskTapped()
}

// MARK: - Output
protocol AddTaskViewModelOutput: ObservableObject {
    var isFormValid: Bool { get }
    var success: AnyPublisher<PlannedModel, Never> { get }
    var error: AnyPublisher<String, Never> { get }
}
