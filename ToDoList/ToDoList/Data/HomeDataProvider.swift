//
//  HomeDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 21/12/2025.
//

import Combine
import SwiftUI

protocol HomeDataProviderProtocol {
    func getCalendarDays() -> [CalenderModel]
    func getProjects() -> [PlannedModel]
    func observeTodaysTasks() -> AnyPublisher<[PlannedModel], Never>
    func deleteTask(at index: Int)
}

// MARK: - Data Provider Implementation
//
final class HomeDataProvider: HomeDataProviderProtocol {
    private let taskStore: TaskStore
    
    init(taskStore: TaskStore) {
        self.taskStore = taskStore
    }
    
    func getCalendarDays() -> [CalenderModel] {
        return [
            .init(day: "Sun", number: 1, progress: 0.9),
            .init(day: "Mon", number: 2, progress: 0.6),
            .init(day: "Tue", number: 3, progress: 0.4),
            .init(day: "Wed", number: 4, progress: 1),
            .init(day: "Thu", number: 5, progress: 0.8),
            .init(day: "Fri", number: 6, progress: 0.4),
            .init(day: "Sat", number: 7, progress: 0.7),
            .init(day: "Sun", number: 8, progress: 0.9),
            .init(day: "Mon", number: 9, progress: 0.6),
            .init(day: "Tue", number: 10, progress: 0.4),
            .init(day: "Wed", number: 11, progress: 1),
            .init(day: "Thu", number: 12, progress: 0.8),
            .init(day: "Fri", number: 13, progress: 0.4),
        ]
    }
    
    func getProjects() -> [PlannedModel] {
        return [
            .init(
                title: "bag",
                subTitle: "Swift",
                day: "Saturday",
                start: "10:00pm",
                end: "11:00pm",
                imageName: "bag",
                colorSubTitle: .LightGray,
                colorCircle: .white,
                backgroundColor: .lightPink
            ),
            .init(
                title: "To Do List",
                subTitle: "3 tasks",
                day: "Saturday",
                start: "10:00pm",
                end: "11:00pm",
                imageName: "cubes",
                colorSubTitle: .LightGray,
                colorCircle: .darkGreen,
                backgroundColor: .lightGreen
            ),
        ]
    }
    
    func observeTodaysTasks() -> AnyPublisher<[PlannedModel], Never> {
        return taskStore.$todaysTasks.eraseToAnyPublisher()
    }
    
    func deleteTask(at index: Int) {
        taskStore.deleteTask(at: index)
    }
}
