//
//  AddTaskViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 13/12/2025.
//

import Combine
import SwiftUI

@MainActor
final class AddTaskViewModel: AddTaskViewModelType {
    
    // MARK: - Dependencies
    private let taskStore: TaskStoreProtocol
    
    // MARK: - Internal State
    @Published var taskName: String = ""
    @Published var taskTitle: String = ""
    @Published var taskSubTitle: String = ""
    @Published var taskDescription: String = ""
    
    // MARK: - Publishers
    private let successSubject = PassthroughSubject<PlannedModel, Never>()
    private let errorSubject = PassthroughSubject<String, Never>()
    
    // MARK: - Outputs
    var success: AnyPublisher<PlannedModel, Never> {
        successSubject.eraseToAnyPublisher()
    }
    
    var error: AnyPublisher<String, Never> {
        errorSubject.eraseToAnyPublisher()
    }
    
    var isFormValid: Bool {
        !taskName.isEmpty &&
        !taskTitle.isEmpty &&
        !taskSubTitle.isEmpty &&
        !taskDescription.isEmpty
    }
    
    // MARK: - Init
    init(taskStore: TaskStoreProtocol) {
        self.taskStore = taskStore
    }
}
// MARK: - Input
//
extension AddTaskViewModel {
    func createTaskTapped() {
        guard isFormValid else {
            errorSubject.send(L10n.Error.emptyField)
            return
        }

        let task = PlannedModel(
            title: taskTitle,
            subTitle: taskSubTitle,
            day: L10n.Calendar.friday,
            start: "8:00" + L10n.Time.pm,
            end: "10:00" + L10n.Time.pm,
            imageName: "cubes",
            colorSubTitle: .gray,
            colorCircle: .white,
            backgroundColor: .black
        )

        taskStore.addTask(task)
        successSubject.send(task)
        clearForm()
    }
}
// MARK: - Private Handler
//
private extension AddTaskViewModel {
    func clearForm() {
        taskName = ""
        taskTitle = ""
        taskSubTitle = ""
        taskDescription = ""
    }
}
