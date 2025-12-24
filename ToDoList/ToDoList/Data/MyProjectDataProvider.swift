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
                title: L10n.Projects.toDoList,
                subTitle: L10n.Projects.tasksCount(2),
                day: L10n.Tasks.today,
                start: "9:00\(L10n.Time.am)",
                end: "10:00\(L10n.Time.am)",
                imageName: "test",
                colorSubTitle: .gray,
                colorCircle: .blue,
                backgroundColor: .green
            ),
            .init(
                title: L10n.Projects.bag,
                subTitle: L10n.Projects.tasksCount(4),
                day: L10n.Tasks.tomorrow,
                start: "2:00\(L10n.Time.pm)",
                end: "3:00\(L10n.Time.pm)",
                imageName: "test2",
                colorSubTitle: .gray,
                colorCircle: .red,
                backgroundColor: .yellow
            ),
        ]
    }
}
