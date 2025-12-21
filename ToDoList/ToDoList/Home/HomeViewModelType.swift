//
//  HomeViewModelType.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 21/12/2025.
//

import Foundation

// MARK: - Protocols

/// Input actions from View to ViewModel
protocol HomeViewModelInput: ObservableObject {
    func viewDidLoad()
    func deleteTask(at index: Int)
    func refreshData()
}

/// Output data from ViewModel to View
protocol HomeViewModelOutput: ObservableObject {
    var days: [CalenderModel] { get }
    var todaysTasks: [PlannedModel] { get }
    var projects: [PlannedModel] { get }
    var isLoading: Bool { get }
}

/// Combined ViewModel Type
protocol HomeViewModelType: HomeViewModelInput, HomeViewModelOutput {}
