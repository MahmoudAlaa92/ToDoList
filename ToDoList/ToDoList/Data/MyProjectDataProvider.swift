//
//  MyProjectDataProvider.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import SwiftUI

// MARK: - Protocol
protocol MyProjectDataProviderProtocol {
    func fetchProjects() -> [PlannedModel]
}

// MARK: - Implementation
final class MyProjectDataProvider: MyProjectDataProviderProtocol {
    
    // MARK: - Singleton
    static let shared = MyProjectDataProvider()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public Methods
    func fetchProjects() -> [PlannedModel] {
        return [
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
            .init(
                title: "To Do List",
                subTitle: "3 tasks",
                day: "Mondat",
                start: "10:00pm",
                end: "11:00pm",
                imageName: "cubes",
                colorSubTitle: .darkGray,
                colorCircle: .white,
                backgroundColor: .lightGreen
            ),
        ]
    }
}

// MARK: - Mock Data Provider (For Testing)
final class MockMyProjectDataProvider: MyProjectDataProviderProtocol {
    
    // MARK: - Properties
    var mockProjects: [PlannedModel]
    var shouldReturnEmpty: Bool
    
    // MARK: - Initialization
    init(projects: [PlannedModel]? = nil, shouldReturnEmpty: Bool = false) {
        self.shouldReturnEmpty = shouldReturnEmpty
        self.mockProjects = projects ?? Self.defaultMockProjects()
    }
    
    // MARK: - Public Methods
    func fetchProjects() -> [PlannedModel] {
        return shouldReturnEmpty ? [] : mockProjects
    }
    
    // MARK: - Helper Methods
    func setProjects(_ projects: [PlannedModel]) {
        self.mockProjects = projects
    }
    
    func reset() {
        self.mockProjects = Self.defaultMockProjects()
        self.shouldReturnEmpty = false
    }
    
    // MARK: - Private Methods
    private static func defaultMockProjects() -> [PlannedModel] {
        return [
            .init(
                title: "Test Project 1",
                subTitle: "2 tasks",
                day: "Today",
                start: "9:00am",
                end: "10:00am",
                imageName: "test",
                colorSubTitle: .gray,
                colorCircle: .blue,
                backgroundColor: .green
            ),
            .init(
                title: "Test Project 2",
                subTitle: "4 tasks",
                day: "Tomorrow",
                start: "2:00pm",
                end: "3:00pm",
                imageName: "test2",
                colorSubTitle: .gray,
                colorCircle: .red,
                backgroundColor: .yellow
            ),
        ]
    }
}
