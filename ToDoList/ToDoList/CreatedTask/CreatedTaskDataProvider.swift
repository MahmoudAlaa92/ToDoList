//
//  CreatedTaskDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import SwiftUI

// MARK: - Protocol
protocol CreatedTaskDataProviderProtocol {
    func fetchPlannedTasks() -> [PlannedModel]
    func fetchAssignedPersons() -> [String]
}

// MARK: - Implementation
final class CreatedTaskDataProvider: CreatedTaskDataProviderProtocol {
    
    // MARK: - Singleton
    static let shared = CreatedTaskDataProvider()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public Methods
    func fetchPlannedTasks() -> [PlannedModel] {
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
            .init(
                title: "Design System Updates",
                subTitle: "UI Components",
                day: "Tomorrow",
                start: "9:00 am",
                end: "12:00 pm",
                imageName: "Mobile trading",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightPink
            ),
        ]
    }
    
    func fetchAssignedPersons() -> [String] {
        return ["woman", "teenagerGirl", "youngSmilingMan"]
    }
}
// MARK: - Mock Data Provider (For Testing)
//
final class MockCreatedTaskDataProvider: CreatedTaskDataProviderProtocol {
    
    // MARK: - Properties
    var mockTasks: [PlannedModel] = []
    var mockPersons: [String] = []
    
    // MARK: - Initialization
    init(tasks: [PlannedModel]? = nil, persons: [String]? = nil) {
        self.mockTasks = tasks ?? defaultMockTasks()
        self.mockPersons = persons ?? defaultMockPersons()
    }
    
    // MARK: - Public Methods
    func fetchPlannedTasks() -> [PlannedModel] {
        return mockTasks
    }
    
    func fetchAssignedPersons() -> [String] {
        return mockPersons
    }
    
    // MARK: - Private Methods
    private func defaultMockTasks() -> [PlannedModel] {
        return [
            .init(
                title: "Test Task 1",
                subTitle: "Test Subtitle",
                day: "Today",
                start: "9:00 am",
                end: "10:00 am",
                imageName: "test",
                colorSubTitle: Color.gray,
                colorCircle: Color.blue,
                backgroundColor: Color.green
            ),
            .init(
                title: "Test Task 2",
                subTitle: "Another Test",
                day: "Tomorrow",
                start: "2:00 pm",
                end: "3:00 pm",
                imageName: "test2",
                colorSubTitle: Color.gray,
                colorCircle: Color.red,
                backgroundColor: Color.yellow
            ),
        ]
    }
    
    private func defaultMockPersons() -> [String] {
        return ["testPerson1", "testPerson2"]
    }
}
