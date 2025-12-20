//
//  MyProjectViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Combine

// MARK: - Input Protocol
protocol MyProjectViewModelInput: ObservableObject {
    func didTapAddProject()
    func didTapProject(_ project: PlannedModel)
    func didTapBack()
    func didTapNotification()
    func didTapSearch()
}

// MARK: - Output Protocol
protocol MyProjectViewModelOutput: ObservableObject {
    var projectItems: [PlannedModel] { get }
}

// MARK: - Type Alias
typealias MyProjectViewModelType = MyProjectViewModelInput & MyProjectViewModelOutput 
