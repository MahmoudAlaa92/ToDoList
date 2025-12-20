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
            .init(title: "All", number: 2),
            .init(title: "High Priority", number: 1),
            .init(title: "Medium Priority", number: 2),
            .init(title: "Low Priority", number: 2),
            .init(title: "Not Priority", number: 1),
        ]
    }
    
    func fetchPriorityTasks() -> [PlannedModel] {
        return [
            .init(
                title: "Client Review &Feedback",
                subTitle: "Redesign App",
                day: "Today",
                start: "10:00 am",
                end: "4:00 pm",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
            .init(
                title: "Client Review",
                subTitle: "Redesign App",
                day: "Today",
                start: "10:00 am",
                end: "4:00 pm",
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
                title: "To Do List",
                subTitle: "3 tasks",
                day: "Monday",
                start: "10:00pm",
                end: "11:00pm",
                imageName: "cubes",
                colorSubTitle: .darkGray,
                colorCircle: .white,
                backgroundColor: .lightGreen
            ),
            .init(
                title: "bag",
                subTitle: "5 tasks",
                day: "Friday",
                start: "10:00pm",
                end: "11:00pm",
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
            .init(title: "Test All", number: 1),
            .init(title: "Test High", number: 1),
        ]
    }
    
    private static func defaultPriorityTasks() -> [PlannedModel] {
        return [
            .init(
                title: "Test Task",
                subTitle: "Test Subtitle",
                day: "Today",
                start: "9:00 am",
                end: "10:00 am",
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
                title: "Test Project",
                subTitle: "2 tasks",
                day: "Today",
                start: "10:00am",
                end: "11:00am",
                imageName: "test",
                colorSubTitle: .gray,
                colorCircle: .blue,
                backgroundColor: .green
            )
        ]
    }
}
