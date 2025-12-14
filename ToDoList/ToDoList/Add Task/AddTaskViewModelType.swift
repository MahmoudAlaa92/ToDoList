//
//  AddTaskViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 13/12/2025.
//

import Foundation
import Combine


typealias AddTaskViewModelType = AddTaskViewModelTypeInput & AddTaskViewModelTypeOutput

// MARK: - ViewModel Input
//
protocol AddTaskViewModelTypeInput {
    func updateTaskName(_ name: String)
    func updateTaskTitle(_ title: String)
    func updateTaskSubTitle(_ subTitle: String)
    func updateTaskDescription(_ description: String)
    func createdTaskTapped()
}
// MARK: - ViewModel Output
//
protocol AddTaskViewModelTypeOutput {
    var createdError: PassthroughSubject<String, Never> { get }
    var createdSuccess: PassthroughSubject<PlannedModel, Never> { get }
}
