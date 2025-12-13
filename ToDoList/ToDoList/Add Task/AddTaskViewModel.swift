//
//  AddTaskViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 13/12/2025.
//

import Foundation
import Combine

class AddTaskViewModel: ObservableObject, AddTaskViewModelType {
    
    /// Input handling
    ///
    private let taskName = CurrentValueSubject<String, Never>("")
    private let taskTitle = CurrentValueSubject<String, Never>("")
    private let taskSubTitle = CurrentValueSubject<String, Never>("")
    private let taskDescription = CurrentValueSubject<String, Never>("")
    
    /// Outputs
    ///
    var createdError =  PassthroughSubject<String, Never>()
    var createdSuccess = PassthroughSubject<String, Never>()
  
}
// MARK: - AddTaskViewModelInput
//
extension AddTaskViewModel {
    func updateTaskName(_ name: String) {
        taskName.send(name)
    }
    
    func updateTaskTitle(_ title: String) {
        taskTitle.send(title)
    }
    
    func updateTaskSubTitle(_ subTitle: String) {
        taskSubTitle.send(subTitle)
    }
    
    func updateTaskDescription(_ description: String) {
        taskDescription.send(description)
    }
    
    func createdTaskTapped() {
        guard !taskName.value.isEmpty,
              !taskTitle.value.isEmpty,
              !taskSubTitle.value.isEmpty,
              !taskDescription.value.isEmpty else {
            createdError.send("There is an empty field")
            return
        }
        
        createdSuccess.send("Task Created Successfuly")
    }
}
