//
//  PlannedDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import SwiftUI

// MARK: - Protocol
protocol PlannedDataProviderProtocol {
    func fetchPlannedTasks() -> [PlannedModel]
}

final class PlannedDataProvider: PlannedDataProviderProtocol {
    
    // MARK: - Singleton
    static let shared = PlannedDataProvider()
    
    // MARK: - Init
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
                title: "Code Review Session",
                subTitle: "Backend API",
                day: "Tomorrow",
                start: "2:00 pm",
                end: "4:00 pm",
                imageName: "cubes",
                colorSubTitle: Color.LightGray,
                colorCircle: Color.lightBeige,
                backgroundColor: Color.lightGreen
            ),
        ]
    }
}

// MARK: - Mock Data Provider (For Testing)
final class MockPlannedDataProvider: PlannedDataProviderProtocol {
    
    // MARK: - Properties
    var mockTasks: [PlannedModel]
    var shouldReturnEmpty: Bool
    
    // MARK: - Initialization
    init(tasks: [PlannedModel]? = nil, shouldReturnEmpty: Bool = false) {
        self.shouldReturnEmpty = shouldReturnEmpty
        self.mockTasks = tasks ?? Self.defaultTasks()
    }
    
    // MARK: - Public Methods
    func fetchPlannedTasks() -> [PlannedModel] {
        return shouldReturnEmpty ? [] : mockTasks
    }
    
    // MARK: - Helper Methods
    func setTasks(_ tasks: [PlannedModel]) {
        self.mockTasks = tasks
    }
    
    func addTask(_ task: PlannedModel) {
        mockTasks.append(task)
    }
    
    func reset() {
        self.mockTasks = Self.defaultTasks()
        self.shouldReturnEmpty = false
    }
    
    // MARK: - Private Methods
    private static func defaultTasks() -> [PlannedModel] {
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
}
