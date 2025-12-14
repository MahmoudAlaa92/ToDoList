//
//  AddTaskViewModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 13/12/2025.
//

import SwiftUI
import Combine

@MainActor
final class AddTaskViewModel: ObservableObject, AddTaskViewModelType {
    
    /// Dependencies
    ///
    private let taskStore: TaskStore
    
    /// Input handling
    ///
    @Published var taskName = ""
    @Published var taskTitle = ""
    @Published var taskSubTitle = ""
    @Published var taskDescription = ""
    
    /// Outputs
    ///
    var createdError = PassthroughSubject<String, Never>()
    var createdSuccess = PassthroughSubject<PlannedModel, Never>()
    
    init(taskStore: TaskStore) {
        self.taskStore = taskStore
    }
}
// MARK: - AddTaskViewModelInput
//
extension AddTaskViewModel {
    func updateTaskName(_ name: String) {
        taskName = name
    }
    
    func updateTaskTitle(_ title: String) {
        taskTitle = title
    }
    
    func updateTaskSubTitle(_ subTitle: String) {
        taskSubTitle = subTitle
    }
    
    func updateTaskDescription(_ description: String) {
        taskDescription = description
    }
    
    func createdTaskTapped() {
        guard !taskName.isEmpty,
              !taskTitle.isEmpty,
              !taskSubTitle.isEmpty,
              !taskDescription.isEmpty
        else {
            createdError.send("There is an empty field")
            return
        }
        
        createdSuccess.send(
            PlannedModel(
                title: taskTitle,
                subTitle: taskSubTitle,
                day: "Friday",
                start: "8:00pm",
                end: "10:00pm",
                imageName: "cubes",
                colorSubTitle: Color.gray,
                colorCircle: Color.white,
                backgroundColor: Color.black
            )
        )
        
        taskName = ""
        taskTitle = ""
        taskSubTitle = ""
        taskDescription = ""
    }
}
