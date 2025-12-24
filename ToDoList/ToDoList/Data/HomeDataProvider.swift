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
    // MARK: - Properties
    private let taskStore: TaskStore
    
    // MARK: - Init
    init(taskStore: TaskStore) {
        self.taskStore = taskStore
    }
    
    func getCalendarDays() -> [CalenderModel] {
        return [
            .init(day: L10n.Calendar.saturday, number: 1, progress: 0.9),
            .init(day: L10n.Calendar.sunday, number: 2, progress: 0.9),
            .init(day: L10n.Calendar.monday, number: 3, progress: 0.6),
            .init(day: L10n.Calendar.tuesday, number: 4, progress: 0.4),
            .init(day: L10n.Calendar.wednesday, number: 5, progress: 1),
            .init(day: L10n.Calendar.thursday, number: 6, progress: 0.8),
            .init(day: L10n.Calendar.friday, number: 7, progress: 0.4),
            .init(day: L10n.Calendar.saturday, number: 8, progress: 0.9),
            .init(day: L10n.Calendar.sunday, number: 9, progress: 0.9),
            .init(day: L10n.Calendar.monday, number: 10, progress: 0.6),
            .init(day: L10n.Calendar.tuesday, number: 11, progress: 0.4),
            .init(day: L10n.Calendar.wednesday, number: 12, progress: 1),
            .init(day: L10n.Calendar.thursday, number: 13, progress: 0.8),
            .init(day: L10n.Calendar.friday, number: 14, progress: 0.4),
        ]
    }
    
    func getProjects() -> [PlannedModel] {
        return [
            .init(
                title: L10n.Projects.bag,
                subTitle: L10n.Projects.swift,
                day: L10n.Calendar.saturday,
                start: "10:00" + L10n.Time.pm,
                end: "11:00" + L10n.Time.pm,
                imageName: "bag",
                colorSubTitle: .LightGray,
                colorCircle: .white,
                backgroundColor: .lightPink
            ),
            .init(
                title: L10n.Projects.toDoList,
                subTitle: L10n.Projects.tasksCount(3),
                day: L10n.Calendar.saturday,
                start: "10:00" + L10n.Time.pm,
                end: "11:00" + L10n.Time.pm,
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
