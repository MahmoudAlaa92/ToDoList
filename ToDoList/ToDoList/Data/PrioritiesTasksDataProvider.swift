//
//  PrioritiesTasksDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import SwiftUI

// MARK: - Protocol
protocol PrioritiesTasksDataProviderProtocol {
    func fetchPriorityItems() -> [PriorityModel]
    func fetchPriorityTasks() -> [PlannedModel]
    func fetchProjects() -> [PlannedModel]
}

// MARK: - Implementation
final class PrioritiesTasksDataProvider: PrioritiesTasksDataProviderProtocol {
    
    // MARK: - Singleton
    static let shared = PrioritiesTasksDataProvider()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Public Methods
    func fetchPriorityItems() -> [PriorityModel] {
        return [
            .init(title: L10n.Tasks.all, number: 2),
            .init(title: L10n.Tasks.highPriority, number: 1),
            .init(title: L10n.Tasks.mediumPriority, number: 2),
            .init(title: L10n.Tasks.lowPriority, number: 2),
            .init(title: L10n.Tasks.notPriority, number: 1),
        ]
    }
    
    func fetchPriorityTasks() -> [PlannedModel] {
        return [
            .init(
                title: L10n.Tasks.clientReview,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "10:00 \(L10n.Time.am)",
                end: "4:00 \(L10n.Time.pm)",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: L10n.Tasks.clientReviewShort,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "10:00 \(L10n.Time.am)",
                end: "4:00 \(L10n.Time.pm)",
                imageName: "cubes",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
        ]
    }
    
    func fetchProjects() -> [PlannedModel] {
        return [
            .init(
                title: L10n.Projects.toDoList,
                subTitle: L10n.Projects.tasksCount(3),
                day: L10n.Tasks.monday,
                start: "10:00\(L10n.Time.pm)",
                end: "11:00\(L10n.Time.pm)",
                imageName: "cubes",
                colorSubTitle: .darkGray,
                colorCircle: .white,
                backgroundColor: .lightGreen
            ),
            .init(
                title: L10n.Projects.bag,
                subTitle: L10n.Projects.tasksCount(5),
                day: L10n.Tasks.friday,
                start: "10:00\(L10n.Time.pm)",
                end: "11:00\(L10n.Time.pm)",
                imageName: "bag",
                colorSubTitle: .darkGray,
                colorCircle: .darkPrimaryApp,
                backgroundColor: .lightPink
            ),
        ]
    }
}

// MARK: - Mock Data Provider (For Testing)
final class MockPrioritiesTasksDataProvider: PrioritiesTasksDataProviderProtocol {
    
    // MARK: - Properties
    var mockPriorityItems: [PriorityModel]
    var mockPriorityTasks: [PlannedModel]
    var mockProjects: [PlannedModel]
    
    // MARK: - Initialization
    init(
        priorityItems: [PriorityModel]? = nil,
        priorityTasks: [PlannedModel]? = nil,
        projects: [PlannedModel]? = nil
    ) {
        self.mockPriorityItems = priorityItems ?? Self.defaultPriorityItems()
        self.mockPriorityTasks = priorityTasks ?? Self.defaultPriorityTasks()
        self.mockProjects = projects ?? Self.defaultProjects()
    }
    
    // MARK: - Public Methods
    func fetchPriorityItems() -> [PriorityModel] {
        return mockPriorityItems
    }
    
    func fetchPriorityTasks() -> [PlannedModel] {
        return mockPriorityTasks
    }
    
    func fetchProjects() -> [PlannedModel] {
        return mockProjects
    }
    
    // MARK: - Helper Methods
    func setPriorityItems(_ items: [PriorityModel]) {
        self.mockPriorityItems = items
    }
    
    func setPriorityTasks(_ tasks: [PlannedModel]) {
        self.mockPriorityTasks = tasks
    }
    
    func setProjects(_ projects: [PlannedModel]) {
        self.mockProjects = projects
    }
    
    func reset() {
        self.mockPriorityItems = Self.defaultPriorityItems()
        self.mockPriorityTasks = Self.defaultPriorityTasks()
        self.mockProjects = Self.defaultProjects()
    }
    
    // MARK: - Private Methods
    private static func defaultPriorityItems() -> [PriorityModel] {
        return [
            .init(title: L10n.Tasks.all, number: 1),
            .init(title: L10n.Tasks.highPriority, number: 1),
        ]
    }
    
    private static func defaultPriorityTasks() -> [PlannedModel] {
        return [
            .init(
                title: L10n.Tasks.clientReview,
                subTitle: L10n.Tasks.redesignApp,
                day: L10n.Tasks.today,
                start: "9:00 \(L10n.Time.am)",
                end: "10:00 \(L10n.Time.am)",
                imageName: "test",
                colorSubTitle: Color.gray,
                colorCircle: Color.blue,
                backgroundColor: Color.green
            )
        ]
    }
    
    private static func defaultProjects() -> [PlannedModel] {
        return [
            .init(
                title: L10n.Projects.toDoList,
                subTitle: L10n.Projects.tasksCount(2),
                day: L10n.Tasks.today,
                start: "10:00\(L10n.Time.am)",
                end: "11:00\(L10n.Time.am)",
                imageName: "test",
                colorSubTitle: .gray,
                colorCircle: .blue,
                backgroundColor: .green
            )
        ]
    }
}
